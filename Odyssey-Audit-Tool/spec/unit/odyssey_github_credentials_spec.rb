require 'spec_helper' # must come before other requires
require 'highline'

RSpec.describe 'Odyssey configureGitHubCredentials' do
  before do
    @credentials_path = File.expand_path('~/.odyssey/credentials.json')
    @high_line = HighLine.new
    allow(HighLine).to receive(:new).and_return(@high_line)
  end

  it 'Creates GitHubCredentials if not exists' do
    expect(STDOUT).to receive(:puts).with('Setting up GitHub credentials...')
    expect(STDOUT).to receive(:puts).with('Trying to authenticate with GitHub...')
    expect(STDOUT).to receive(:puts).with('Successful!')
    expect(STDOUT).to receive(:puts).with("Credentials written to #{@credentials_path}")
    allow(@high_line).to receive(:ask).with('Please enter your GitHub username:').and_return('user')
    allow(@high_line).to receive(:ask).with('Please enter your GitHub token:').and_return('token')
    allow(GithubHelper).to receive(:test).and_return(true)
    allow(FileUtils).to receive(:mkpath).with(File.dirname(@credentials_path))
    allow(File).to receive(:write).with(@credentials_path, "{\n  \"github_oauth\": \"token\",\n  \"github_user\": \"user\"\n}")
    allow(File).to receive(:exist?).and_return(false)

    odyssey = Odyssey.new('.')
    odyssey.configureGitHubCredentials(false)
  end

  it 'Creates GitHubCredentials if exists and forced' do
    expect(STDOUT).to receive(:puts).with('Setting up GitHub credentials...')
    expect(STDOUT).to receive(:puts).with('Trying to authenticate with GitHub...')
    expect(STDOUT).to receive(:puts).with('Successful!')
    expect(STDOUT).to receive(:puts).with("Credentials written to #{@credentials_path}")
    allow(@high_line).to receive(:ask).with('Please enter your GitHub username:').and_return('user')
    allow(@high_line).to receive(:ask).with('Please enter your GitHub token:').and_return('token')
    allow(GithubHelper).to receive(:test).and_return(true)
    allow(FileUtils).to receive(:mkpath).with(File.dirname(@credentials_path))
    allow(File).to receive(:write).with(@credentials_path, "{\n  \"github_oauth\": \"token\",\n  \"github_user\": \"user\"\n}")
    allow(File).to receive(:exist?).and_return(true)

    odyssey = Odyssey.new('.')
    odyssey.configureGitHubCredentials(true)
  end

  it 'Does not create GitHubCredentials if exists' do
    allow(File).to receive(:exist?).and_return(true)
    odyssey = Odyssey.new('.')
    odyssey.configureGitHubCredentials(false)
  end
end

