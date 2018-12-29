require 'spec_helper' # must come before other requires
require 'json'
require 'Odyssey'
require 'json'
require 'github_api'
require 'webmock'
require 'vcr'

RSpec.describe 'Odyssey print_issues' do

  VCR.configure do |config|
    config.cassette_library_dir = "spec/vcr"
    config.hook_into :webmock
  end

  before do
    @odyssey = Odyssey.new('/test/project')
    allow(@odyssey).to receive(:getGitHubCredentials).and_return({'github_oauth'=> 'test_token', 'github_user'=> 'test_user'})
    allow(Odyssey).to receive(:checkConfigParams).with('/test/project/config.json', @odyssey.required_project_params)
                          .and_return({'internal_audit_repo'=> 'test/test_repo'})
    allow(@odyssey).to receive(:updateAvailable?).and_return(false)
  end

  context GithubHelper do
    it 'print issues ' do
      VCR.use_cassette('GithubHelper/print_issues') do
        expect(STDOUT).to receive(:puts).with('Repo - Severity - State - Title  ')
        expect(STDOUT).to receive(:puts).with('test/test_repo - Critical - open - Derivate compiler output and duplicate files in source repo ')
        expect(STDOUT).to receive(:puts).with('test/test_repo - Critical - open - Derivate compiler output and duplicate files in source repo ')
        expect(STDOUT).to receive(:puts).with('test/test_repo - Major - open - Major Issue')
        expect(STDOUT).to receive(:puts).with('test/test_repo - Medium - open - Medium Issue #1')
        expect(STDOUT).to receive(:puts).with('test/test_repo - Minor - open - Single Line Issue.')

        @odyssey.print_issues
      end
    end
  end
end
