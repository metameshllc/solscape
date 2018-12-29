# https://developer.github.com/v3/issues/
# https://www.rubydoc.info/github/piotrmurach/github/master/frames
require 'fileutils'
require 'github_api'
require 'highline'
require 'json'
require 'open-uri'


class GithubHelper
  def self.test(_username, oauth_token)
    begin
      github = Github.new oauth_token: oauth_token
      github.users.emails.list do |_|
        return true
      end
    rescue Github::Error::GithubError => e
      puts e.response_message
    end
    false
  end

  def self.createRepoAndInviteUsers(repo, oauth_token, org, team, repo_privacy)
    is_repo_private = repo_privacy == 'private'
    begin
      github = Github.new oauth_token: oauth_token
      all_teams = github.orgs.teams.list org
      team_list = all_teams.select do |i|
        i.name == team && i.organization.login == org
      end
      team_id = team_list[0].id
      team_members = github.orgs.teams.list_members team_id
      members_username = []

      team_members.each do |m|
        members_username <<  m.login
      end
      # create repo
      github.repos.create name: repo, org: org, private: is_repo_private #, team_id: team_id

      # invite memebrs
      members_username.each do |user|
        github.repos.collaborators.add org, repo, user, permission: 'admin'
      end
    rescue => e
      puts "#{e.message}"
      raise "Some error occured"
    end
  end

  def self.getIssuesForRepo(oauth_token, github_repo)
    begin
      github = Github.new oauth_token: oauth_token
      repos = github_repo.split(",")
      r = []
      repos.each do |repo|
        user = repo.split("/")[0]
        repo_name = repo.split("/")[1]
        issues = github.issues.list user: user, repo: repo_name , filter:'all', state:'all', sort: 'created', per_page:100
        issues.each do |issue|
          r_item = {}
          r_item['repo_name'] = github_repo.split("/")[1]
          r_item['repo_url'] = "https://github.com/" + github_repo
          r_item['number'] = issue['number']
          r_item['url'] = issue['html_url']
          r_item['title'] = issue['title']
          r_item['state'] = issue['state']
          r_item['body'] = issue['body']
          r_item['labels'] = issue['labels']
          r_item['severity'] = getSeverity(issue)
          r_item['remediation_update'] =""

          if !r_item['severity'].to_s.empty?
            if r_item['state'].match(/closed/i)
              r_item['remediation_update'] = getRemediationUpdate(oauth_token,user,repo_name,r_item['number'])
              if r_item['remediation_update'].to_s.empty?
                r_item['remediation_update'] = "The issue has been closed"
              end
            else
              r_item['remediation_update'] = "The issue is currently under review"
            end
          end
          r.push r_item
        end
      end
    rescue => e
      puts "#{e.message}, #{github_repo}"
      raise "Something went wrong when fetching the issues from the Github repo #{github_repo}"
    end
    r
  end

  def self.getRemediationUpdate(oauth_token,user,repo_name,id)
    github = Github.new  oauth_token: oauth_token
    comments = github.issues.comments.all user: user, repo: repo_name , number: id
    found = ""

    comments.each do |comment|

      if comment['body'].match(/@Odyssey/i)
        found = comment['body'].to_s.gsub(/@Odyssey/i,"")
      end
    end

    found
  end

  def self.getIssueswithLabel(issues,label_search,state="all")
    r = []

    issues.each do |issue|
      if issue['labels'].to_s.match(/#{label_search}/i)
        if state =~ /all/
          r.push(issue)
        elsif state =~ /#{issue['state']}/
            r.push(issue)
        end
      end
    end
    r
  end

  def self.addLinks(issues)
    chapter_nr = 1
    r = []

    issues.each do |issue|
      title = (issue['title']).to_s.strip
      link = "#3" + chapter_nr.to_s + " " + title.to_s.downcase
      link.gsub!(' ', '-')
      link.gsub!('.', '-')
      link.gsub!(':', '')
      link.gsub!('/', '')
      link.gsub!('\'', '')
      chapter_nr += 1
      issue['link'] = link
      r.push issue
    end
    r
  end

  def self.valueExistsInIssues(issues, name, value)
    issues.each do |issue|
      if issue[name] == value
        return true
      end
    end
    false
  end

  def self.createAuditTodos(oauth_token, user, audit_repo, auditTodo_repo)
    existing_issues = GithubHelper.getIssuesForRepo(oauth_token, audit_repo)

    auditTodo_repo_issues = GithubHelper.getIssuesForRepo(oauth_token, auditTodo_repo)
    auditTodos = GithubHelper.getIssueswithLabel(auditTodo_repo_issues,"Audit-Todo")

    issues_title = []
    auditTodos.each do |at|
      if at["state"] =~ /open/
        unless valueExistsInIssues(existing_issues,'title', at['title'])
          issue_title = createIssue(oauth_token,
                                    user,
                                    audit_repo,
                                    at['title'],
                                    at['body'],
                                    "Audit-Todo")
          issues_title.push issue_title
        end
      end
    end
    issues_title
  end


  def self.createIssue(oauth_token, user, repo, title, body, label)
    repo_user = repo.split("/")[0]
    repo = repo.split("/")[1]
    github = Github.new user: repo_user, repo: repo, oauth_token: oauth_token
    issue = github.issues.create title: title, body: body, assignee: "", labels: [label]
    issue_url = issue['html_url']
    title
  end

  def self.getSeverity(issue)
    labels = issue['labels'].to_s
    if labels =~ /name="Minor"/i
      return "Minor"
    elsif labels =~ /name="Medium"/i
        return "Medium"
    elsif labels =~ /name="Major"/i
      return "Major"
    elsif labels =~ /name="Critical"/i
      return "Critical"
    else
      return nil
    end

  end

  def self.matchPermalink(text, pos=0)
    %r{https?://github.com/([^/]+)/([^/]+)/blob/([^/]+)/([^#]+)#(L[0-9]+(.*)(L[0-9]+)?)}.match(text, pos)
  end

  def self.parsePermalink(permalink)
    m = matchPermalink(permalink)
    owner = m[1]
    repo = m[2]
    sha = m[3]
    path = m[4]
    if m[5].count('-') == 0 && m[5].count('L') == 2
      splitted_m = m[5].split('L')
      line_range = [splitted_m[1].to_i-1, splitted_m[2].to_i-1]
    else
      line_range = m[5].split('-').map { |r| r[1..-1].to_i - 1 }
    end
    [owner, repo, sha, path, line_range]
  end

  def self.getCode(permalink, access_token)
    begin
      (owner, repo, sha, path, line_range) = parsePermalink(permalink)

      url = "https://api.github.com/repos/#{owner}/#{repo}/contents/#{path}?ref=#{sha}"
      body = open(url, 'Authorization'=>"token #{access_token}", 'Accept'=>'application/vnd.github.v3.raw').read
      lines = body.split("\n")
  
      if line_range.length == 1
        lines[line_range[0]]
      else
        lines[line_range[0]..line_range[1]].join("\n")
      end
    rescue => e
      raise e
    end
  end
  
  def self.createLabelsIfNotExists(oauth_token, github_repo, labels)
    puts "Ensure GitHub repo #{github_repo} has the required labels: #{labels.map {|k, _| k}}"
    repo_user = github_repo.split("/")[0]
    repo = github_repo.split("/")[1]
    github = Github.new user: repo_user, repo: repo, oauth_token: oauth_token
    
    existing_labels = {}
    github.issues.labels.list.each{|label| existing_labels[label['name'].downcase.to_sym] = label['color']}
    
    labels.each {|name, color|
      k = name.downcase.to_sym
      if existing_labels[k] == nil
        github.issues.labels.create name: name, color: color
        puts "Created #{name} color: #{color}"
      elsif !existing_labels[k].downcase.eql? color
        github.issues.labels.update label_name: name, name: name, color: color
        puts "Updated #{name} color: #{color}"
      else
        puts "Nothing to do for #{name}"
      end
    }
  end

end
