require 'spec_helper'
require 'github_api'
require 'GithubHelper'
require 'webmock'
require 'vcr'
require 'json'

RSpec.describe 'GithubHelper' do
  before do
    issues = [
        {
            'number' => 1,
            'html_url' => 'http://a.b.c',
            'labels' => double(:to_s=>'{name="Critical"}'),
            'state' => 'closed'
        },
        {
            'number' => 2,
            'html_url' => 'http://a.b.c',
            'labels' => double(:to_s=>'{name="Critical"}'),
            'state' => 'closed'
        },
    ]
    @github = double('github',
                     :users => double('users', :emails => double('emails')),
                     :issues => double('issues',
                                       :list => issues,
                                       :comments => double('comments'),
                                       :labels => double('labels')))
    allow(Github::Client).to receive(:new).and_return(@github)
  end

  it "test method returns true if it gets non-empty email list from github" do
    expect(@github.users.emails).to receive(:list).and_yield('user@example.com')
    expect(GithubHelper.test('test_user', 'test_token')).to be(true)
  end

  it "test method returns false if it gets empty email list from github" do
    expect(@github.users.emails).to receive(:list)
    expect(GithubHelper.test('test_user', 'test_token')).to be(false)
  end

  it "test method returns false on error" do
    expect(@github.users.emails).to receive(:list).and_raise(Github::Error::GithubError.new('test'))
    expect(GithubHelper.test('test_user', 'test_token')).to be (false)
  end

  it 'getIssuesForRepo return issues' do
    expect(@github.issues.comments).to receive(:all).with(user: 'test', repo: 'test_repo', number: 1).and_return([{'body'=>'@Odyssey Test'}])
    expect(@github.issues.comments).to receive(:all).with(user: 'test', repo: 'test_repo', number: 2).and_return([{'body'=>'Test'}])
    expect(GithubHelper.getIssuesForRepo('test_token', 'test/test_repo')[0]['severity']).to eq('Critical')
  end

  it 'getIssuesForRepo raise on error' do
    expect(STDOUT).to receive(:puts).with('test, test/test_repo')
    expect(@github.issues).to receive(:list).and_raise(Github::Error::GithubError.new('test'))
    expect {
      GithubHelper.getIssuesForRepo('test_token', 'test/test_repo')
    }.to raise_error('Something went wrong when fetching the issues from the Github repo test/test_repo')
  end

  it 'getCode raise on error' do
    expect(GithubHelper).to receive(:open).and_raise(Github::Error::GithubError.new('test'))
    expect{
      GithubHelper.getCode('https://github.com/infgeoax/ethereum-libraries/blob/bcd15f73f0c229f7f4ac05bc872994a2cb571d65/BasicMathLib/BasicMathLib.sol#L16', 'token')
    }.to raise_error(Github::Error::GithubError)
  end

  it 'createLabel if not exists' do
    existing_labels = [
        {'name'=> 'Critical', 'color'=> 'ff0000'}, {'name'=>'Minor', 'color'=> '1d76db'}
    ]
    expect(@github.issues.labels).to receive(:list).and_return(existing_labels)
    expect(@github.issues.labels).to receive(:create).twice
    expect(@github.issues.labels).to receive(:update).once
    GithubHelper.createLabelsIfNotExists('token', 'test/test_repo', {
        :Critical => 'b60205',
        :Major => 'd93f0b',
        :Medium => 'fbca04',
        :Minor => '1d76db',
    })
  end

  after do
    allow(Github::Client).to receive(:new).and_call_original
  end
end