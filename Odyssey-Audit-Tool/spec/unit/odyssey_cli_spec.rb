require 'spec_helper' # must come before other requires
require 'Cli'

RSpec.describe 'Command line executable' do
  before do
    @odyssey = Odyssey.new('.')
    expect(Dir).to receive(:pwd).at_least(1).and_return('.')
    expect(Odyssey).to receive(:new).at_least(1).with('.').and_return(@odyssey)
  end

  context 'odyssey' do
    it 'create Odyssey object in Dir.pwd and prints help message' do
      ARGV.replace []
      expect(STDOUT).to receive(:puts).with([
          'Usage:',
          '    odyssey [options]',
          '    -i, --init                       Initialise project name',
          '    -p, --print-issues               Print all issues for a repo',
          '    -t, --todos                      Upload Audit Todos',
          '    -r, --render                     Create final report by rendering issues, TOC, scope',
          '    -e, --export filename            Export stand-alone Markdown report',
          '    -c, --configure                  Configure GitHub credentials',
          '    -u, --update                     Update the gem',
          '    -a, --analysis                   Run analysis tools & generate analysis report.',
          '    -s, --scoping                    Run scoping tools & generate scoping report.',
          '    -f, --format type,string         Format bytes based on type: RemixBytes, Call or Transaction',
          '    -v, --version                    Show Version',
          '    -h, --help                       Show this message' + "\n",
                                            ].join("\n"))

      main
    end

    it 'calls odyssey.init_project method for -i' do
      expect(@odyssey).to receive(:init_project).twice
      ARGV.replace %w[-i]
      main
      ARGV.replace %w[--init]
      main
    end

    it 'calls odyssey.print_issues method for -p' do
      expect(@odyssey).to receive(:print_issues).twice
      ARGV.replace %w[-p]
      main
      ARGV.replace %w[--print-issues]
      main
    end

    it 'calls odyssey.upload_audit_todos method for -t' do
      expect(@odyssey).to receive(:upload_audit_todos).twice
      ARGV.replace %w[-t]
      main
      ARGV.replace %w[--todos]
      main
    end

    it 'calls odyssey.render_report method for -r' do
      expect(@odyssey).to receive(:render_report).twice
      ARGV.replace %w[-r]
      main
      ARGV.replace %w[--render]
      main
    end

    it 'calls odyssey.configureGitHubCredentials method for -c' do
      expect(@odyssey).to receive(:configureGitHubCredentials).twice.with(true)
      ARGV.replace %w[-c]
      main
      ARGV.replace %w[--configure]
      main
    end

    it 'formats inputs -f RemixBytes,string' do
      expect(STDOUT).to receive(:puts).twice.with('["0x12","0x34","0x56","0x78","0x90","0xab","0xcd","0xef"]')
      ARGV.replace %w[-f RemixBytes,1234567890abcdef]
      main
      ARGV.replace %w[--format RemixBytes,1234567890abcdef]
      main
    end

    it 'formats inputs -f Call,string' do
      2.times {
        expect(STDOUT).to receive(:puts).with('Function Signature: 12345678')
        expect(STDOUT).to receive(:puts).with('Function Params:')
        expect(STDOUT).to receive(:puts).with([])
      }

      ARGV.replace %w[-f Call,1234567890abcdef]
      main
      ARGV.replace %w[--format Call,1234567890abcdef]
      main
    end

    it 'format input -f Transaction,string' do
      2.times {
        [
            'Contract: 0123456789012345678901234567890123456789',
            'Function Signature: 89012345',
            'Function Params:',
            ['6789012345678901234567890123456789012345678901234567890123456789']
        ].each{|l|
          expect(STDOUT).to receive(:puts).with(l)
        }
      }
      bytes = '0123456789'*15
      ARGV.replace ['-f', "Transaction,#{bytes}"]
      main
      ARGV.replace ['--format', "Transaction,#{bytes}"]
      main
    end
  end
end
