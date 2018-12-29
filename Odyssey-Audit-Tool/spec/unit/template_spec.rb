require 'spec_helper' # must come before other requires
require 'require_all'
require_rel '../../lib/'
require 'json'
require 'github_api'
require 'webmock'
require 'vcr'

odyssey_path = __dir__ + '/../../'
template_path = odyssey_path + 'Audit-Templates/templates/'

RSpec.describe 'Template' do
  let(:config) {JSON.parse(File.read("./spec/config.json"))}

  VCR.configure do |config|
    config.cassette_library_dir = 'spec/vcr'
    config.hook_into :webmock
  end

  context 'Renderer' do
    it 'render template' do
      renderer = ERB.new('')
      expect(renderer).to receive(:result)
      Template.renderTemplate(renderer)
    end
  end

  context 'Markdown' do
    it 'convert Github issues to markdown' do
      VCR.use_cassette('GithubHelper/all_issues', record: :new_episodes) do
        issues = GithubHelper.getIssuesForRepo(config['github_oauth'],config['github_repo'])
        expect do
          Template.issuesToMarkdown(issues, template_path, config['github_oauth'])
        end.not_to raise_exception
      end
    end

    it 'create issue overview table' do
      VCR.use_cassette('GithubHelper/all_issues', record: :new_episodes) do
        issues =  GithubHelper.getIssuesForRepo(config['github_oauth'], config['github_repo'])

        expect {
          Template.createIssueOverview(issues, template_path)
        }.not_to raise_exception
      end
    end

    it 'create issue list table' do
      VCR.use_cassette('GithubHelper/all_issues', record: :new_episodes) do
        issues =  GithubHelper.getIssuesForRepo(config['github_oauth'], config['github_repo'])

        expect {
          Template.createIssueList(issues, template_path)
        }.not_to raise_exception
      end
    end

    it 'create issue list table without apostrophe' do
      VCR.use_cassette('GithubHelper/all_issues', record: :new_episodes) do
        issues =  GithubHelper.getIssuesForRepo(config['github_oauth'], config['github_repo'])

        expect(Template.createIssueList(issues, template_path)).not_to include('#32-major-issue-with\'-apostrophe')
      end
    end

    it 'generate a report with issues and issue overview' do
      VCR.use_cassette('GithubHelper/all_issues', record: :new_episodes) do
        issues =  GithubHelper.getIssuesForRepo(config['github_oauth'],config['github_repo'])
        expect {
          report_template = './spec/report/test_project_report_working.md'
          filename_final = Template.generateReport(issues,report_template, template_path, config['github_oauth'])

          Template.generateTOC(filename_final, odyssey_path)
        }.not_to raise_exception
      end
    end

    #it 'generate scope' do
    #  expect(File).to receive(:read).with('template_pathscope.md').and_return('scope')
    #  expect(Template.generateScope('test_contracts', 'template_path')).to eq('scope')
    #end
  end
end
