require 'spec_helper' # must come before other requires

require 'require_all'
require_rel '../../lib/'
require 'json'
require 'github_api'
require 'webmock'
require 'vcr'


#RSpec.describe 'File' do
#  let(:config) {JSON.parse(File.read("./spec/config.json"))}

#  context 'Contracts' do
#    it 'generates list of contracts with file hashes' do
#      FileHelper.getContracts('./spec/contracts/')
#    end

#    it 'test contact existence' do
#      expect(FileHelper.contractExists([
#                                    {'contract0'=>'func1', 'contract3'=>'func2'},
#                                    {'contract1'=>'func21'}
#                                ], 'contract1')).to be(true)
#      expect(FileHelper.contractExists([
#                                           {'contract0'=>'func1', 'contract3'=>'func2'},
#                                           {'contract1'=>'func21'}
#                                       ], 'contract2')).to be(false)
#    end

#    it 'format params for functions' do
#      expect(FileHelper.formatParams('foo(a,b,c,contract aaa b,1 2 3)')).to eq('foo(a,b,c,address,1)')
#    end

#    it 'get function hash' do
#      FileHelper.getFunctionHash(['spec/contracts'], '')
#    end
#  end
#end


