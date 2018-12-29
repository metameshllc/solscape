require 'spec_helper'
require 'require_all'
require_rel '../../lib/'
require 'json'
require 'github_api'


RSpec.describe 'Issues' do
  let(:config) {JSON.parse(File.read("./test/config.json"))}

  context GithubHelper do
    # it 'fetches issues from Github ' do
    #   issues =  GithubHelper.getIssuesForRepo(config['github_oauth'], config['github_repo'])
    #   expect(issues[0]['title']).to_not be_nil
    #   expect(issues[0]['body']).to_not be_nil
    #   expect(issues[0]['labels']).to_not be_nil
    #
    #   expect(issues[0]['lol']).to be_nil
    # end
    #
    # it 'creates an issue' do
    #   #GithubHelper.createIssue(config)
    # end
  end

end