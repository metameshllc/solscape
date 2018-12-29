require 'erb'

class Template
  def self.getRenderer(filename)
    ERB.new(File.read(filename))
  end

  def self.renderTemplate(renderer)
    puts output = renderer.result(binding)
  end

  def self.issuesToMarkdown(issues, template_path, oauth_token, standalone=false)
    critical = GithubHelper.getIssueswithLabel(issues, 'Critical')
    major = GithubHelper.getIssueswithLabel(issues, 'Major')
    medium = GithubHelper.getIssueswithLabel(issues, 'Medium')
    minor = GithubHelper.getIssueswithLabel(issues, 'Minor')

    issues_ordered = critical + major + medium + minor

    issues_formated = ''
    chapter_nr = 1

    issues_ordered.each do |issue|
      url_to_issue = standalone ? '' : " ([##{issue['number']}](#{issue['url']})) "
      chapter_no = standalone ? 2 : 3
      issues_formated += "### #{chapter_no}.#{chapter_nr} #{issue['title']}#{url_to_issue}\n\n"
      chapter_nr +=1

      repo_url = issue['repo_url']
      repo_name =  issue['repo_name']
      state =  issue['state']
      severity =  issue['severity']
      url_title = issue['url'].match(/(issues\/\d+)/)
      url =  issue['url']
      remediation_update = issue['remediation_update']

      renderer = Template.getRenderer(template_path + 'issue_properties.md')
      output = renderer.result(binding)

      # add the issue table
      issues_formated +=  output + "\n\n"

      # add the issue body whatever is in the issue
      issues_formated += Template.renderPermalinks(issue['body'], oauth_token) + "\n\n"
    end

    issues_formated
  end

  def self.renderPermalinks(body, oauth_token)
    r = ''
    pos = 0
    while true
      m = GithubHelper.matchPermalink(body, pos)
      if m.nil?
        break
      else
        permalink = m[0]
        r += body[pos, m.begin(0) - pos] + "\n\n"
        (_, _, sha, path, line_range) = GithubHelper.parsePermalink(permalink)
        r += "[#{path}:#{line_range.map {|r| "L#{r+1}"}.join('-')}](#{permalink})\n\n"
        r += "```Solidity\n"
        r += GithubHelper.getCode(permalink, oauth_token) + "\n"
        r += "```\n\n"
        pos = m.end(0)
      end
    end
    r += body[pos..-1]
    r
  end

  def self.generateTOC(filename, odyssey_path)
    markdown_toc = `ruby #{odyssey_path}/ext/tocdown/toc.rb -d 2 -b -m #{filename}`

    file_content = File.read(filename)
    file_content.sub!('<!--59bcc3ad6775562f845953cf01624225-->', markdown_toc)

    File.write(filename,file_content)
  end

  def self.generateReport(issues,report_working,template_path,oauth_token, standalone=false, filename = nil)
    issue_overview = createIssueOverview(issues,template_path)
    issues_markdown = issuesToMarkdown(issues,template_path,oauth_token, standalone)
    issue_list = createIssueList(issues,template_path, standalone)

    renderer = Template.getRenderer(report_working)
    output = renderer.result(binding)

    report_filename = filename ? filename : report_working.sub('working.md', 'final.md')
    File.write(report_filename, output)
    report_filename
  end


  def self.generateScope(contract_dirs, template_path)
    contract_list = FileHelper.getContracts(contract_dirs)

    renderer = Template.getRenderer(template_path + 'scope.md')
    renderer.result(binding)
  end

  def self.createIssueOverview(issues,template_path)
    critical_o = GithubHelper.getIssueswithLabel(issues, "Critical","open").length
    major_o = GithubHelper.getIssueswithLabel(issues, "Major","open").length
    medium_o = GithubHelper.getIssueswithLabel(issues, "Medium","open").length
    minor_o = GithubHelper.getIssueswithLabel(issues, "Minor","open").length

    critical_c = GithubHelper.getIssueswithLabel(issues, "Critical","closed").length
    major_c = GithubHelper.getIssueswithLabel(issues, "Major","closed").length
    medium_c = GithubHelper.getIssueswithLabel(issues, "Medium","closed").length
    minor_c = GithubHelper.getIssueswithLabel(issues, "Minor","closed").length

    renderer = Template.getRenderer(template_path + 'issue_overview.md')
    output = renderer.result(binding)
  end


  def self.createIssueList(issues, template_path, standalone = false)
    critical = GithubHelper.getIssueswithLabel(issues, 'Critical')
    major = GithubHelper.getIssueswithLabel(issues, 'Major')
    medium = GithubHelper.getIssueswithLabel(issues, 'Medium')
    minor = GithubHelper.getIssueswithLabel(issues, 'Minor')

    issues_ordered = critical + major + medium + minor

    issues_ordered_with_links = GithubHelper.addLinks(issues_ordered)

    renderer = Template.getRenderer(template_path + 'issue_list.md')
    output = renderer.result(binding)
  end
end
