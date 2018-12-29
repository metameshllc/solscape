require 'spec_helper' # must come before other requires
require 'highline'
require 'Odyssey'

RSpec.describe 'Odyssey configureGitHubCredentials' do
  before do
    d = DateTime.now
    @odyssey = Odyssey.new('/test/project')
    allow(@odyssey).to receive(:getGitHubCredentials).and_return({'github_oauth' => 'test_token', 'github_user' => 'test_user'})
    @high_line = HighLine.new
    allow(HighLine).to receive(:new).and_return(@high_line)

    @config_file_content = "{\n  \"client_name\": \"test_project\",\n  \"client_audit_report_repo\": \"\",\n  \"internal_audit_repo\": \"\",\n  \"github_todo_audit_repo\": \"ConsenSys/todo-audits\"\n}"
    @dummy_gemspec = Gem::Specification.new do
      metadata = {}
    end

    @client_audit_report_repo = "test_project-audit-report-#{d.strftime("%Y-%m")}"
    @internal_audit_repo = "test_project-audit-internal-#{d.strftime("%Y-%m")}"
  end

  it 'Raise exception if directory not empty' do
    allow(Dir).to receive(:entries).and_return([1, 2, 3])
    expect {@odyssey.init_project}.to raise_error(error = RuntimeError)
  end

  it 'Initialize project directory' do
    allow(@odyssey).to receive(:auditTemplatesUpdateAvailable?).and_return(false)
    allow(@odyssey).to receive(:gemUpdateAvailable?).and_return(false)
    allow(File).to receive(:exists?).with(@odyssey.audit_templates_path).and_return(true)

    expect(Dir).to receive(:entries).and_return([1, 2])
    expect(@high_line).to receive(:ask).with('Enter the client name:').and_return('test_project')
    expect(@odyssey).to receive(:getGemSpec).and_return(@dummy_gemspec)
    expect(File).to receive(:exists?).with(@odyssey.audit_templates_path).and_return(true)
    expect(@high_line).to receive(:ask).with("Creating client audit report repository at https://github.com/ConsenSys/#{@client_audit_report_repo} are you ok with that? (y/n)").and_return('n')
    expect(STDOUT).to receive(:puts).with("ok, you will need to specify the repo in the config.json file afterwards")
    expect(@high_line).to receive(:ask).with("Creating internal audit repository at https://github.com/ConsenSys/#{@internal_audit_repo} are you ok with that? (y/n)").and_return('n')
    expect(STDOUT).to receive(:puts).with("ok, you will need to specify the repo in the config.json file afterwards.\nskipping TODO issues creation. This can be done afterwards using the -t flag.")
    expect(@high_line).to receive(:ask).with("Please enter the GitHub TODO Audit repo. Enter blank for default:").and_return('ConsenSys/todo-audits')
    expect(FileUtils).to receive(:cp).with(@odyssey.audit_templates_path + '/templates//.gitignore', '.')
    expect(FileUtils).to receive(:cp).with(@odyssey.audit_templates_path + '/templates//report.md', 'test_project-working.md')
    expect(FileUtils).to receive(:cp).with(@odyssey.audit_templates_path + '/templates//standalone-report.md', 'test_project-standalone-working.md')
    expect(FileUtils).to receive(:cp_r).with(@odyssey.audit_templates_path + '/static-content/', '.', verbose: false)
    expect(FileUtils).to receive(:mkpath).with('./static-content-project-specific')
    expect(FileUtils).to receive(:touch).with('./static-content-project-specific/.gitignore')
    expect(FileUtils).to receive(:mkpath).with('./coverage-reports')
    expect(FileUtils).to receive(:touch).with('./coverage-reports/.gitignore')
    expect(FileUtils).to receive(:mkpath).with('./tool-output')
    expect(FileUtils).to receive(:touch).with('./tool-output/.gitignore')
    expect(FileUtils).to receive(:mkpath).with('./tool-output/surya')
    expect(FileUtils).to receive(:touch).with('./tool-output/surya/.gitignore')
    expect(FileUtils).to receive(:mkpath).with('./tool-output/mythril')
    expect(FileUtils).to receive(:touch).with('./tool-output/mythril/.gitignore')
    expect(FileUtils).to receive(:mkpath).with('./tool-output/solhint')
    expect(FileUtils).to receive(:touch).with('./tool-output/solhint/.gitignore')
    expect(File).to receive(:write).with('/test/project/config.json', @config_file_content)
    expect(STDOUT).to receive(:puts).with("--- 1 ---")
    expect(STDOUT).to receive(:puts).with("Writing project_config to config.json.")
    expect(STDOUT).to receive(:puts).with("--- 2 ---")
    expect(STDOUT).to receive(:puts).with("Reports created here: test_project-working.md and test_project-standalone-working.md. You can start writing, have fun!")
    expect(STDOUT).to receive(:puts).with("--- 3 ---")
    expect(STDOUT).to receive(:puts).with("Skipping upload of Audit Todos")
    expect(STDOUT).to receive(:puts).with('--- 4 ---')
    expect(STDOUT).to receive(:puts).with("Skipping label creation")
    expect(STDOUT).to receive(:puts).with("--- 5 ---")
    expect(STDOUT).to receive(:puts).with("You can render the report with option -r. This will fetch all issues from the Github repos and populate them to the report")
    expect(STDOUT).to receive(:puts).with("Remember to create all issues in Github and assign severity levels\n\n")

    @odyssey.init_project
  end

  it 'Initialize project directory with spaces in name' do
    project_name = 'test_project with spaces'
    project_name_no_whitepace = project_name.gsub(' ', '_')
    client_audit_report_repo = "#{project_name.gsub(' ', '-')}-audit-report-#{DateTime.now.strftime("%Y-%m")}"
    internal_audit_repo = "#{project_name.gsub(' ', '-')}-audit-internal-#{DateTime.now.strftime("%Y-%m")}"
    config_file_content = "{\n  \"client_name\": \"#{project_name.gsub(' ', '-')}\",\n  \"client_audit_report_repo\": \"\",\n  \"internal_audit_repo\": \"\",\n  \"github_todo_audit_repo\": \"ConsenSys/todo-audits\"\n}"

    allow(@odyssey).to receive(:auditTemplatesUpdateAvailable?).and_return(false)
    allow(@odyssey).to receive(:gemUpdateAvailable?).and_return(false)
    allow(File).to receive(:exists?).with(@odyssey.audit_templates_path).and_return(true)

    expect(Dir).to receive(:entries).and_return([1, 2])
    expect(@high_line).to receive(:ask).with('Enter the client name:').and_return(project_name)
    expect(@odyssey).to receive(:getGemSpec).and_return(@dummy_gemspec)
    expect(File).to receive(:exists?).with(@odyssey.audit_templates_path).and_return(true)
    expect(@high_line).to receive(:ask).with("Creating client audit report repository at https://github.com/ConsenSys/#{client_audit_report_repo} are you ok with that? (y/n)").and_return('n')
    expect(STDOUT).to receive(:puts).with("ok, you will need to specify the repo in the config.json file afterwards")
    expect(@high_line).to receive(:ask).with("Creating internal audit repository at https://github.com/ConsenSys/#{internal_audit_repo} are you ok with that? (y/n)").and_return('n')
    expect(STDOUT).to receive(:puts).with("ok, you will need to specify the repo in the config.json file afterwards.\nskipping TODO issues creation. This can be done afterwards using the -t flag.")
    expect(@high_line).to receive(:ask).with("Please enter the GitHub TODO Audit repo. Enter blank for default:").and_return('ConsenSys/todo-audits')
    expect(FileUtils).to receive(:cp).with(@odyssey.audit_templates_path + '/templates//.gitignore', '.')
    expect(FileUtils).to receive(:cp).with(@odyssey.audit_templates_path + '/templates//report.md', "#{project_name_no_whitepace}-working.md")
    expect(FileUtils).to receive(:cp).with(@odyssey.audit_templates_path + '/templates//standalone-report.md', "#{project_name_no_whitepace}-standalone-working.md")
    expect(FileUtils).to receive(:cp_r).with(@odyssey.audit_templates_path + '/static-content/', '.', verbose: false)
    expect(FileUtils).to receive(:mkpath).with('./static-content-project-specific')
    expect(FileUtils).to receive(:touch).with('./static-content-project-specific/.gitignore')
    expect(FileUtils).to receive(:mkpath).with('./coverage-reports')
    expect(FileUtils).to receive(:touch).with('./coverage-reports/.gitignore')
    expect(FileUtils).to receive(:mkpath).with('./tool-output')
    expect(FileUtils).to receive(:touch).with('./tool-output/.gitignore')
    expect(FileUtils).to receive(:mkpath).with('./tool-output/surya')
    expect(FileUtils).to receive(:touch).with('./tool-output/surya/.gitignore')
    expect(FileUtils).to receive(:mkpath).with('./tool-output/mythril')
    expect(FileUtils).to receive(:touch).with('./tool-output/mythril/.gitignore')
    expect(FileUtils).to receive(:mkpath).with('./tool-output/solhint')
    expect(FileUtils).to receive(:touch).with('./tool-output/solhint/.gitignore')
    expect(File).to receive(:write).with('/test/project/config.json', config_file_content)
    expect(STDOUT).to receive(:puts).with("--- 1 ---")
    expect(STDOUT).to receive(:puts).with("Writing project_config to config.json.")
    expect(STDOUT).to receive(:puts).with("--- 2 ---")
    expect(STDOUT).to receive(:puts).with("Reports created here: #{project_name_no_whitepace}-working.md and #{project_name_no_whitepace}-standalone-working.md. You can start writing, have fun!")
    expect(STDOUT).to receive(:puts).with("--- 3 ---")
    expect(STDOUT).to receive(:puts).with("Skipping upload of Audit Todos")
    expect(STDOUT).to receive(:puts).with('--- 4 ---')
    expect(STDOUT).to receive(:puts).with("Skipping label creation")
    expect(STDOUT).to receive(:puts).with("--- 5 ---")
    expect(STDOUT).to receive(:puts).with("You can render the report with option -r. This will fetch all issues from the Github repos and populate them to the report")
    expect(STDOUT).to receive(:puts).with("Remember to create all issues in Github and assign severity levels\n\n")

    @odyssey.init_project
  end
end
