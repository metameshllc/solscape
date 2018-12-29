require 'spec_helper' # must come before other requires
require 'require_all'
require_rel '../../lib/'
require 'json'
require 'github_api'
require 'webmock'
require 'vcr'

RSpec.describe 'Issues' do
  let(:config) {JSON.parse(File.read("./spec/config.json"))}

  VCR.configure do |config|
    config.cassette_library_dir = "spec/vcr"
    config.hook_into :webmock
  end

  context GithubHelper do
    it 'filters issues based on severity' do
      VCR.use_cassette('GithubHelper/all_issues', :record => :new_episodes) do
        issues = GithubHelper.getIssuesForRepo(config['github_oauth'], config['github_repo'])
        issues_filtered = GithubHelper.getIssueswithLabel(issues, "Minor")
        expect(issues_filtered.length).to be >= 1
      end
    end


    it 'creates issues' do
      VCR.use_cassette('GithubHelper/create_issue', :record => :new_episodes) do
        issue_title = GithubHelper.createIssue('test_token', "test_user", "test_user/test_repo/", "Title 1", "Empty", 'Text')
        expect(issue_title).to eq 'Title 1'
      end
    end

  end
end