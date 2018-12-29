require 'spec_helper' # must come before other requires
require 'highline'
require 'json'
require 'Odyssey'
require 'json'
require 'github_api'
require 'webmock'
require 'vcr'

RSpec.describe 'Odyssey upload_audit_todos' do

  VCR.configure do |config|
    config.cassette_library_dir = 'spec/vcr'
    config.hook_into :webmock
  end

  before do
    @odyssey = Odyssey.new('/test/project')
    allow(@odyssey).to receive(:getGitHubCredentials).and_return({'github_oauth'=> 'test_token', 'github_user'=> 'test_user'})
    allow(Odyssey).to receive(:checkConfigParams).with('/test/project/config.json', @odyssey.required_project_params)
                          .and_return({'internal_audit_repo'=> 'test/test_repo', 'project_name'=> 'test project',
                                      'contract_dir'=> 'contract', 'github_todo_audit_repo'=> 'test/test_todo_audit'})
    allow(@odyssey).to receive(:updateAvailable?).and_return(false)
    FileUtils.cp(@odyssey.audit_templates_path+'/templates/report.md', 'test_project-working.md')
  end

  after do
  end

  context 'upload autit todos' do
    it 'upload audit todos create new issues' do
      VCR.use_cassette('GithubHelper/upload_audit_todos') do
        expect(STDOUT).to receive(:puts).with('Uploading test cases to test/test_repo')
        expect(STDOUT).to receive(:puts).with('Created Audit Todos in test/test_repo:')
        expect(STDOUT).to receive(:puts).with(["Audit Todo 3", "Audit Todo 2"])
        @odyssey.upload_audit_todos
      end
    end

    it 'upload audit_todos nothing to do' do
      expect(STDOUT).to receive(:puts).with('Uploading test cases to test/test_repo')
      expect(STDOUT).to receive(:puts).with('Audit Todos already exist in the repo. Nothing to do.')
      expect(GithubHelper).to receive(:createAuditTodos).and_return([])
      @odyssey.upload_audit_todos
    end
  end

  context 'Odyssey Config' do
    it 'checkGithubRepo raise error for invalid repo' do
      expect {
        Odyssey.checkGithubRepo 'test_repo', 'test_repo'
      }.to raise_error(Odyssey.badGithubRepoFormatMessage('test_repo'))
    end

    it 'checkConfigParams raise error if file does not exists' do
      allow(File).to receive(:exist?).with('non-existent-file').and_return(false)
      allow(Odyssey).to receive(:checkConfigParams).and_call_original
      expect {
        Odyssey.checkConfigParams 'non-existent-file', []
      }.to raise_error('Config file missing non-existent-file')
    end

    it 'checkConfigParams raise error if param does not exists' do
      allow(File).to receive(:exist?).with('non-existent-file').and_return(true)
      allow(File).to receive(:read).with('non-existent-file').and_return('{"param1":"value1"}')
      allow(Odyssey).to receive(:checkConfigParams).and_call_original
      expect {
        Odyssey.checkConfigParams 'non-existent-file', ['param2']
      }.to raise_error('Required config parameter param2 not set for non-existent-file')
    end

    it 'getConfigItem return the value is name exists otherwise true' do
      expect(Odyssey.getConfigItem({'param'=>'value'}, 'param')).to eq('value')
      expect(Odyssey.getConfigItem({'param'=>'value'}, 'param2')).to be(true)
    end

    it 'configureGithubCredentials force: true calls exit if it got SystemExit/EOFError/Interrupt' do
      hl = double('highline')
      allow(HighLine).to receive(:new).and_return hl
      [
          SystemExit, EOFError, Interrupt
      ].each {
        |e|
        expect(hl).to receive(:ask).and_raise(e.new)
        expect(@odyssey).to receive(:exit).and_raise('exit(1)')
        expect{
          @odyssey.configureGitHubCredentials true
        }.to raise_error('exit(1)')
      }
    end

    it 'getGitHubCredentials return normally' do
      allow(Odyssey).to receive(:checkConfigParams).and_return({'github_oauth'=>'1','github_user'=>'2'})
      allow(@odyssey).to receive(:getGitHubCredentials).and_call_original
      expect(@odyssey.getGitHubCredentials).to eq({'github_oauth'=>'1','github_user'=>'2'})
    end

    it 'getGitHubCredentials try to configure github credentials on failing to load it' do
      times = 0
      allow(Odyssey).to receive(:checkConfigParams) do
        times += 1
        if times == 1
          raise 'anything'
        end
        {'github_oauth'=>'1','github_user'=>'2'}
      end
      allow(@odyssey).to receive(:getGitHubCredentials).and_call_original
      expect(@odyssey).to receive(:configureGitHubCredentials).with(true)
      expect(@odyssey.getGitHubCredentials).to eq({'github_oauth'=>'1','github_user'=>'2'})
    end
  end
end