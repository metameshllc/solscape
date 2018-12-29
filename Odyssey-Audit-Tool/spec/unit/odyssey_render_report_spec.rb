require 'spec_helper' # must come before other requires
require 'json'
require 'Odyssey'
require 'json'
require 'github_api'
require 'webmock'
require 'vcr'

RSpec.describe 'Odyssey render_report' do

  VCR.configure do |config|
    config.cassette_library_dir = 'spec/vcr'
    config.hook_into :webmock
  end

  before do
    @odyssey = Odyssey.new('/test/project')
    allow(@odyssey).to receive(:getGitHubCredentials).and_return({'github_oauth'=> 'test_token', 'github_user'=> 'test_user'})
    allow(Odyssey).to receive(:checkConfigParams).with('/test/project/config.json', @odyssey.required_project_params)
                          .and_return({'internal_audit_repo'=> 'test/test_repo', 'client_name'=> 'test project',
                                      'contract_dir'=> 'contract'})
    allow(@odyssey).to receive(:updateAvailable?).and_return(false)
    FileUtils.cp(@odyssey.audit_templates_path+'/templates/report.md', 'test_project-working.md')
  end

  after do
    FileUtils.remove('test_project-working.md')
    FileUtils.remove('test_project-final.md')
  end

  context GithubHelper do
    it 'render report' do
      VCR.use_cassette('GithubHelper/render_report') do
        allow(Dir).to receive(:[]).with('./coverage-reports/*').and_return([])
        allow(Dir).to receive(:[]).with('./tool-output/surya/*').and_return(['a'])
        allow(Dir).to receive(:[]).with('./tool-output/mythril/*').and_return(['b'])
        allow(Dir).to receive(:[]).with('./tool-output/solhint/*').and_return(['c'])
        expect(STDOUT).to receive(:puts).with('Standard content directory \'./coverage-reports\' is empty, be sure to include it in the final version.')
        expect(STDOUT).to receive(:puts).with('Report written to test_project-final.md')
        @odyssey.render_report
      end
    end
  end
end