require 'optparse'
require_relative 'Odyssey'
require 'readline'

class String
def black;          "\e[30m#{self}\e[0m" end
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def brown;          "\e[33m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def magenta;        "\e[35m#{self}\e[0m" end
def cyan;           "\e[36m#{self}\e[0m" end
def gray;           "\e[37m#{self}\e[0m" end

def bg_black;       "\e[40m#{self}\e[0m" end
def bg_red;         "\e[41m#{self}\e[0m" end
def bg_green;       "\e[42m#{self}\e[0m" end
def bg_brown;       "\e[43m#{self}\e[0m" end
def bg_blue;        "\e[44m#{self}\e[0m" end
def bg_magenta;     "\e[45m#{self}\e[0m" end
def bg_cyan;        "\e[46m#{self}\e[0m" end
def bg_gray;        "\e[47m#{self}\e[0m" end

def bold1;          "\e[1m#{self}\e[22m" end
def italic;         "\e[3m#{self}\e[23m" end
def dim;            "\e[2m#{self}\e[23m" end
def underline;      "\e[4m#{self}\e[24m" end
def blink;          "\e[5m#{self}\e[25m" end
def reverse_color;  "\e[7m#{self}\e[27m" end
end



def main
  @odyssey = Odyssey.new(Dir.pwd)

  # Print usage on empty args
  ARGV << '-h' if ARGV.empty?

  OptionParser.new do |opts|
    opts.banner = 'Usage:
    odyssey [options]'
    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts.to_s
    end
    opts.on('-i', '--init', 'Initialise project name') do
      @odyssey.init_project
    end
    opts.on('-p', '--print-issues', 'Print all issues for a repo') do
      @odyssey.print_issues
    end
    opts.on('-t', '--todos', 'Upload Audit Todos') do
      @odyssey.upload_audit_todos(true)
    end
    opts.on('-r', '--render', 'Create final report by rendering issues, TOC, scope') do
      @odyssey.render_report
    end
    opts.on('-e', '--export filename', 'Export stand-alone Markdown report') do |filename|
      @odyssey.render_report(true, filename)
    end
    opts.on('-c', '--configure', 'Configure GitHub credentials') do
      @odyssey.configureGitHubCredentials true
    end
    opts.on('-u', '--update', 'Update the gem') do
      @odyssey.update
    end
    opts.on('-a', '--analysis', 'Run analysis tools & generate analysis report.') do
      print "Enter the Smart Contract System's Directory".bold1
      print "\n"
      $rootDir = Readline.readline('dir:>')     
      $toolsDir = __dir__
      exec("#$toolsDir/../bin/audit-tools.sh -a #$rootDir" ) 
    end
    opts.on('-s', '--scoping', 'Run scoping tools & generate scoping report.') do
      print "Enter the Smart Contract System's Directory".bold1
      print "\n"
      $rootDir = Readline.readline('dir:>')     
      $toolsDir = __dir__
      exec("#$toolsDir/../bin/audit-tools.sh -s #$rootDir" ) 
    end
    opts.on('-f type,string', '--format type,string', Array, 'Format bytes based on type: RemixBytes, Call or Transaction') do |list|
      options = {}
      options[:type] = list[0]
      options[:string] = list[1]


      if options[:type] == 'RemixBytes'
        bytes = options[:string]
        bytes = bytes.split('0x')[1] if bytes.match(/^0x/)
        bytes_arr = bytes.scan(/../)
        out = '['
        bytes_arr.each_with_index do |byte, i|
          if i == bytes_arr.length - 1
            out += "\"0x#{byte}\""
          else
            out += "\"0x#{byte}\","
          end
        end
        out += ']'
        puts out
      elsif options[:type] == 'Call'
        bytes = options[:string]
        bytes = bytes.split('0x')[1] if bytes.match(/^0x/)

        sig = bytes[0, 8]
        bytes.slice!(0, 8)
        bytes_arr = bytes.scan(/.{64}/)

        puts "Function Signature: #{sig}"
        puts 'Function Params:'
        puts bytes_arr
      elsif options[:type] == 'Transaction'
        bytes = options[:string]
        bytes = bytes.split('0x')[1] if bytes.match(/^0x/)

        junk1 = bytes[0, 30]
        address = bytes[30, 40]
        junk2 = bytes[70, 8]
        sig = bytes[78, 8]

        bytes.slice!(junk1 + address + junk2 + sig)
        bytes_arr = bytes.scan(/.{64}/)

        puts "Contract: #{address}"
        puts "Function Signature: #{sig}"
        puts 'Function Params:'
        puts bytes_arr
      end
    end
    opts.on('-v', '--version', 'Show Version') do
      @odyssey.showVersion
    end
  end.parse!
end

