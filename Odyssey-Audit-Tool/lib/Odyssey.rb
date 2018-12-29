require 'fileutils'
require 'highline'
require 'json'
require 'tmpdir'
require 'git'

require_relative './GithubHelper'
require_relative './Template'

class Odyssey
  attr_reader :odyssey_path
  attr_reader :audit_templates_path
  attr_reader :required_project_params

  def initialize(project_path, credentials_file = '~/.odyssey/credentials.json')
    @odyssey_path = File.dirname(__dir__)
    @audit_templates_path = @odyssey_path + '/Audit-Templates/'
    @template_path = @audit_templates_path + '/templates/'
    @static_content_path = @audit_templates_path + '/static-content/'
    @gemspec_file = @odyssey_path + '/odyssey.gemspec'
    @project_path = project_path
    @project_config_file = @project_path + '/config.json'
    @credentials_file = File.expand_path(credentials_file)

    @required_credential_params = %w[github_oauth github_user]
    @required_project_params = %w[client_name internal_audit_repo github_todo_audit_repo]

    @standard_folders = %w[./coverage-reports ./tool-output/surya ./tool-output/mythril ./tool-output/solhint]
  end

  def init_project
    unless Dir.entries(@project_path).size == 2
      raise "Choose a directory that is empty. Aborting ... don't wanna overwrite something."
    end

    cli = HighLine.new
    d = DateTime.now
    gemspec = getGemSpec
    _ = getGitHubCredentials
    oauth_token =  _.fetch('github_oauth')

    fetchAuditTemplatesSubmodule(oauth_token, gemspec) unless File.exists?(@audit_templates_path)
    updateAuditTemplates if auditTemplatesUpdateAvailable?
    puts "Gem update available\nPlease abort the project initialization and update the gem using `odyssey -u` command" if gemUpdateAvailable?

    repo_org = ENV['REPO_ORG'] || gemspec.metadata.fetch('repo_org'){ 'ConsenSys' }
    repo_team = ENV['REPO_TEAM'] || gemspec.metadata.fetch('repo_team'){ 'diligence' }
    repo_privacy = ENV['REPO_PRIVACY'] || gemspec.metadata.fetch('repo_privacy'){ 'private' }

    project_name = cli.ask('Enter the client name:') do |q|
      # :nocov:
      q.validate = ->(l){l!=""}
      q.responses[:not_valid] = "Client name cannot be blank"
      q.responses[:ask_on_error] = "Please enter the client name:"
      # :nocov:
    end

    project_name_no_whitepace = project_name.tr(' ', '_')

    report_working = project_name_no_whitepace + '-working.md'
    report_working_standalone = project_name_no_whitepace + '-standalone-working.md'
    
    # usually whitespaces in repo names gsubed with '-'
    project_name = project_name.gsub(' ', '-')
    client_audit_report_repo = "#{project_name}-audit-report-#{d.strftime("%Y-%m")}"
    internal_audit_repo = "#{project_name}-audit-internal-#{d.strftime("%Y-%m")}"

    client_audit_report_repo_prompt = cli.ask("Creating client audit report repository at https://github.com/#{repo_org}/#{client_audit_report_repo} are you ok with that? (y/n)"){|q| q.validate = /[y|Y|n|N]/}

    if client_audit_report_repo_prompt.upcase == 'Y'
      createRepoAndInviteUsers(client_audit_report_repo, oauth_token, repo_org, repo_team, repo_privacy)
      client_audit_report_repo = "https://github.com/#{repo_org}/#{client_audit_report_repo}"
    else
      client_audit_report_repo = ''
      puts "ok, you will need to specify the repo in the config.json file afterwards"
    end

    internal_audit_repo_prompt = cli.ask("Creating internal audit repository at https://github.com/#{repo_org}/#{internal_audit_repo} are you ok with that? (y/n)"){|q| q.validate = /[y|Y|n|N]/}

    if internal_audit_repo_prompt.upcase == 'Y'
      createRepoAndInviteUsers(internal_audit_repo,oauth_token,repo_org,repo_team, repo_privacy)
      internal_audit_repo = "https://github.com/#{repo_org}/#{internal_audit_repo}"
    else
      internal_audit_repo = ""
      puts "ok, you will need to specify the repo in the config.json file afterwards.\nskipping TODO issues creation. This can be done afterwards using the -t flag."
    end

    github_todo_audit_repo_uri = "https://github.com/#{repo_org}/todo-audits"
    github_todo_audit_repo = cli.ask("Please enter the GitHub TODO Audit repo. Enter blank for default:") do |q|
      # :nocov:
      q.validate = -> (l) { l.to_s.match? Odyssey.validGithubRepoRegEx }
      q.default = github_todo_audit_repo_uri
      q.responses[:not_valid] = Odyssey.badGithubRepoFormatMessage("github_todo_audit_repo")
      q.responses[:ask_on_error] = "Please enter github_todo_audit_repo in the format specified above or just enter blank for default #{github_todo_audit_repo_uri}"
      # :nocov:
    end

    FileUtils.cp(@template_path + '/.gitignore', '.')
    FileUtils.cp(@template_path + '/report.md', report_working)
    FileUtils.cp(@template_path + '/standalone-report.md', report_working_standalone)
    FileUtils.cp_r(@static_content_path, '.', :verbose => false)

    FileUtils.mkpath './static-content-project-specific'
    FileUtils.touch './static-content-project-specific/.gitignore'
    FileUtils.mkpath './coverage-reports'
    FileUtils.touch './coverage-reports/.gitignore'
    FileUtils.mkpath './tool-output'
    FileUtils.touch './tool-output/.gitignore'
    FileUtils.mkpath './tool-output/surya'
    FileUtils.touch './tool-output/surya/.gitignore'
    FileUtils.mkpath './tool-output/mythril'
    FileUtils.touch './tool-output/mythril/.gitignore'
    FileUtils.mkpath './tool-output/solhint'
    FileUtils.touch './tool-output/solhint/.gitignore'

    project_config = {}
    project_config['client_name'] = project_name
    project_config['client_audit_report_repo'] = client_audit_report_repo
    project_config['internal_audit_repo'] = internal_audit_repo
    project_config['github_todo_audit_repo'] = github_todo_audit_repo
    

    File.write(@project_config_file, JSON.pretty_generate(project_config))

    puts '--- 1 ---'
    puts 'Writing project_config to config.json.'

    puts '--- 2 ---'
    puts "Reports created here: #{report_working} and #{report_working_standalone}. You can start writing, have fun!"

    puts '--- 3 ---'
    if internal_audit_repo_prompt.upcase == 'Y'
      puts "Uploading Audit Todos."
      upload_audit_todos
    else
      puts "Skipping upload of Audit Todos"
    end

    puts '--- 4 ---'
    if internal_audit_repo_prompt.upcase == 'Y'
      create_labels_if_not_exists
    else
      puts "Skipping label creation"
    end

    puts '--- 5 ---'
    puts 'You can render the report with option -r. This will fetch all issues from the Github repos and populate them to the report'
    puts "Remember to create all issues in Github and assign severity levels\n\n"
  end

  def print_issues
    checkForUpdate
    credential_params = getGitHubCredentials
    project_params = Odyssey.checkConfigParams(@project_config_file, @required_project_params)

    puts 'Repo - Severity - State - Title  '
    repos = project_params['internal_audit_repo'].split(',')
    repos.each do |repo|
      issues = GithubHelper.getIssuesForRepo(credential_params['github_oauth'], repo)

      critical = GithubHelper.getIssueswithLabel(issues, 'Critical')
      major = GithubHelper.getIssueswithLabel(issues, 'Major')
      medium = GithubHelper.getIssueswithLabel(issues, 'Medium')
      minor = GithubHelper.getIssueswithLabel(issues, 'Minor')

      issues_ordered = critical + major + medium + minor

      issues_ordered.each do |issue|
        puts repo + ' - ' + issue['severity'] + ' - ' + issue['state'] + ' - ' + issue['title']
      end
    end
  end

  def render_report(standalone = false, filename = nil)
    checkForUpdate
    printWarningForEmptyStandardFolders

    credential_params = getGitHubCredentials
    project_params = Odyssey.checkConfigParams(@project_config_file, @required_project_params)

    repos = project_params['internal_audit_repo'].split(',')
    issues = []

    repos.each do |repo|
      issues += GithubHelper.getIssuesForRepo(credential_params['github_oauth'], repo)
    end
    project_name_no_whitespace = project_params['client_name'].gsub(' ', '_')

    report_working = standalone ? "#{project_name_no_whitespace}-standalone-working.md" : "#{project_name_no_whitespace}-working.md"

    report_final = Template.generateReport(issues, report_working, @template_path, credential_params['github_oauth'], standalone, filename)

    unless standalone
      Template.generateTOC(report_final, @odyssey_path)

      File.symlink(report_final, 'README.md') unless File.exists? 'README.md'
      puts "Report written to #{report_final}"
    else
      puts "Report written to #{filename}"
    end

  end

  def upload_audit_todos(command=false)
    checkForUpdate if command
    credential_params = getGitHubCredentials
    project_params = Odyssey.checkConfigParams(@project_config_file, @required_project_params)

    audit_repos = project_params['internal_audit_repo'].split(',')

    audit_repos.each do |audit_repo|
      puts "Uploading test cases to #{audit_repo}"
      issues_title = GithubHelper.createAuditTodos(credential_params['github_oauth'],
                                                   credential_params['github_user'],
                                                   audit_repo,
                                                   project_params['github_todo_audit_repo'])
      if issues_title.empty?
        puts 'Audit Todos already exist in the repo. Nothing to do.'
      else
        puts "Created Audit Todos in #{audit_repo}:"
        puts issues_title
      end
    end
  end

  def create_labels_if_not_exists()
    labels = {
        :Critical => 'b60205',
        :Major => 'd93f0b',
        :Medium => 'fbca04',
        :Minor => '1d76db',
        :finding => 'd3d3d3',
    }
    # :nocov:
    credential_params = getGitHubCredentials
    project_params = Odyssey.checkConfigParams(@project_config_file, @required_project_params)
    audit_repos = project_params['internal_audit_repo'].split(',')
    audit_repos.each do |audit_repo|
      GithubHelper.createLabelsIfNotExists(credential_params['github_oauth'], audit_repo, labels)
    # :nocov:
    end
  end

  def self.checkGithubRepo(repo, repo_key)
    repo.split(',').map { |r|
      unless r.match? validGithubRepoRegEx
        raise badGithubRepoFormatMessage(repo_key)
      end
      match_data = r.match validGithubRepoRegEx
      match_data[1]
    }.join(',')
  end

  def self.checkConfigParams(file, params)
    cli = HighLine.new

    unless File.exist?(file)
      raise "Config file missing #{file}"
    end

    content = JSON.parse(File.read(file))

    params.each do |param|
      found = false
      content.each do |key, value|
        if key == 'internal_audit_repo' and value.empty?
          # :nocov:
          puts "internal_audit_repo is missing in #{file}"
          value = cli.ask("Please enter internal_audit_repo:") do |q|
            q.validate = Odyssey.validGithubRepoRegEx

            q.responses[:not_valid] = Odyssey.badGithubRepoFormatMessage("internal_audit_repo")
            q.responses[:ask_on_error] = "Please enter internal_audit_repo in the format specified above:"
          end

          content['internal_audit_repo'] = value
          File.write(file, JSON.pretty_generate(content))
          # :nocov:
        end

        if key == param && !value.empty?
          if %r{.*_repo}.match?(key)
            content[key] = checkGithubRepo(value, key)
          end
          found = true
        end
      end
      unless found
        raise "Required config parameter #{param} not set for #{file}"
      end
    end
    content
  end

  def self.getConfigItem(config, name)
    if config[name]
      return config[name]
    else
      return true
    end
  end

  def configureGitHubCredentials(force)
    unless File.exist?(@credentials_file) && !force
      cli = HighLine.new

      begin
        begin
          puts 'Setting up GitHub credentials...'
          username = cli.ask('Please enter your GitHub username:')
          oauth_token = cli.ask('Please enter your GitHub token:') { |q| q.echo = '*' }
          puts 'Trying to authenticate with GitHub...'
        end until !username.strip.empty? && !oauth_token.strip.empty? && GithubHelper.test(username, oauth_token)
        puts 'Successful!'
      rescue SystemExit, Interrupt, EOFError => e
        puts "No changes made to #{@credentials_file}"
        exit(1)
      end

      FileUtils.mkpath(File.dirname(@credentials_file))
      credential_config = {}
      credential_config['github_oauth'] = oauth_token
      credential_config['github_user'] = username
      File.write(@credentials_file, JSON.pretty_generate(credential_config))
      puts "Credentials written to #{@credentials_file}"
    end
  end

  def getGitHubCredentials()
    begin
      credential_params = Odyssey.checkConfigParams(@credentials_file, @required_credential_params)
    rescue => e
      puts 'Error loading GitHub credentials', e
      puts 'You need to setup correct GitHub credentials to continue.'
      configureGitHubCredentials(true)
      credential_params = Odyssey.checkConfigParams(@credentials_file, @required_credential_params)
    end
    credential_params
  end

  def printWarningForEmptyStandardFolders
    @standard_folders.each {|folder|
      if Dir["#{folder}/*"].empty?
        puts "Standard content directory '#{folder}' is empty, be sure to include it in the final version."
      end
    }
  end

  def showVersion()
    puts File.read(File.dirname( __FILE__ )+"/../.version")
    checkForUpdate
  end

  def updateAvailable?
    gemUpdateAvailable? || auditTemplatesUpdateAvailable?
  end

  def update
    # :nocov:
    if gemUpdateAvailable?
      updateGem
    elsif auditTemplatesUpdateAvailable?
      updateAuditTemplates
    else
      puts "No updates are available"
    end
    # :nocov:
  end

  private

  def self.validGithubRepoRegEx
    %r{(?:(?:https?:\/\/(?:www.)?)|(?:git@))(?:github\.com)(?:[\/:])((?:[a-zA-Z0-9-]+)\/(?:[a-zA-Z0-9-]+))(?:\.git)?$}
  end

  def self.badGithubRepoFormatMessage(repo_key)
    "Invalid #{repo_key} format\n"+
    "Valid #{repo_key} value is of the following format:\n"+
    "{https://github.com/}{org or user}/{repo name}.\n"+
    "or\n"+
    "{git@github.com:}{org or user}/{repo name}.git.\n"+
    "For example ConsenSys/tokenfoundry_audit_2018-06-01\n"+
    "or git@github.com:ConsenSys/tokenfoundry_audit_2018-06-01.git"
  end

  def getGemSpec
    gemspec = Gem::Specification.load(@gemspec_file)
  end

  def createRepoAndInviteUsers(repo, oauth_token, org, team, repo_privacy)
    GithubHelper.createRepoAndInviteUsers(repo, oauth_token, org, team, repo_privacy)
  end

  def auditTemplatesUpdateAvailable?
    # :nocov:
    git = Git.open(@audit_templates_path)
    if git.index.readable?
      git.fetch
      git.diff('master', 'origin/master').size > 0
    end
    # :nocov:
  end

  def gemUpdateAvailable?
    # :nocov:
    branch="master"
    gemspec = getGemSpec
    if gemspec && gemspec.metadata
      source_code_uri = gemspec.metadata.fetch("source_code_uri")
      repo, owner = source_code_uri.split("/").reverse
      auth_token = getGitHubCredentials['github_oauth']

      url = "https://api.github.com/repos/#{owner}/#{repo}/contents/odyssey.gemspec?ref=#{branch}"
      body = open(url, 'Authorization'=>"token #{auth_token}", 'Accept'=>'application/vnd.github.v3.raw').read

      gemspec_from_github = eval(body)
      github_gem_version = gemspec_from_github.version
      local_gem_version = gemspec.version

      github_gem_version > local_gem_version
    end
    # :nocov:
  end

  def fetchAuditTemplatesSubmodule(oauth_token, gemspec)
    # :nocov:
    source_code_uri = gemspec.metadata.fetch("source_code_uri")
    repo, owner = source_code_uri.split("/").reverse

    github = Github.new oauth_token: oauth_token
    repo_contents = github.repos.contents user: owner, repo: repo
    audit_templates = repo_contents.get path: 'Audit-Templates'
    submodule_git_url = audit_templates.submodule_git_url
    submodule_git_url_split = submodule_git_url.split("/")
    submodule_git_url_owner = submodule_git_url_split[0].reverse.chomp("git@github.com:".reverse).reverse
    submodule_git_url_repo = submodule_git_url_split[1]

    submodule_git_url = "https://#{oauth_token}:x-oauth-basic@github.com/#{submodule_git_url_owner}/#{submodule_git_url_repo}"
    puts "Audit-Templates not found fetching it"
    Git.clone(submodule_git_url, "Audit-Templates", path: File.expand_path(@odyssey_path))
    # :nocov:
  end

  def updateAuditTemplates
    puts "Updating audit templates"
    git = Git.open(@audit_templates_path)
    git.pull if git.index.readable?
  end

  def updateGem
    branch="master"
    # :nocov:
    if gemUpdateAvailable?
      puts "Updating the gem from github"
      gemspec = getGemSpec
      previous_gem_version = gemspec.version
      source_code_uri = gemspec.metadata.fetch("source_code_uri")
      repo, owner = source_code_uri.split("/").reverse
      auth_token = getGitHubCredentials['github_oauth']

      Dir.mktmpdir do |dir|
        Dir.chdir dir
        system "git clone -b #{branch} https://#{auth_token}:x-oauth-basic@github.com/#{owner}/#{repo}.git"
        Dir.chdir repo
        system "./build_and_install_gem.rb"
        puts "Uninstalling odyssey-#{previous_gem_version}"
        system "gem uninstall odyssey -v #{previous_gem_version}"
      end
    else
      puts "There is no update"
    end
    # :nocov:
  end

  def checkForUpdate
    if File.exists?(@credentials_file) && updateAvailable?
      puts "Newer update available\nPlease use `odyssey -u` to update"
    end
  end
end
