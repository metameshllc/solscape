#!/usr/bin/env ruby

gemspec = File.read('odyssey.gemspec')
version = ""

gemspec.split("\n").each do |line|
  m = line.match(/version\s*?\=\s*?\'(.+)\'/)
  if m
    version = m[1]
    break
  end
end

File.write(".version",version)
`gem build odyssey.gemspec`
puts `gem install odyssey-#{version}.gem`
File.delete(".version")
