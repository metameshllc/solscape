Gem::Specification.new do |s|
  s.name = 'odyssey'
  s.version = '0.2.1'
  s.homepage  = 'https://consensys.net/diligence/'
  s.summary = 'Odyssey Audit Tool'
  s.authors = %w[Gerhard Wagner]
  s.email = 'gerhard.wagner@consensys.net'
  s.licenses = ['Nonstandard']
  s.files = Dir['lib/**/*'] + Dir['ext/**/*'] + ['odyssey.gemspec']
  s.metadata    = { 
    "source_code_uri" => "https://github.com/ConsenSys/Odyssey-Audit-Tool",
    "repo_org" => "ConsenSys", # The org in which the client_audit_report_repo and the internal_audit_repo will be created
    "repo_team" => "Diligence", # Team which will have access to the newly created repos
    "repo_privacy" => "private" # The privacy of the newly created repos, repo will be private only when the value of the repo_privacy is private, otherwise it will be public
  }
  s.executables << 'odyssey'
  s.executables << 'audit-tools.sh'
  s.extensions << 'ext/Rakefile'

  s.add_runtime_dependency 'faraday', '0.12.2'
  s.add_runtime_dependency 'github_api', '0.18.2'
  s.add_runtime_dependency 'highline', '~> 2.0'
  s.add_runtime_dependency 'json', '2.1.0'
  s.add_runtime_dependency 'git', '1.5.0'
  s.add_runtime_dependency 'require_all', '2.0.0'
  s.add_development_dependency 'simplecov', '0.16.1'
  s.add_development_dependency 'bundler', '1.16.2'
  s.add_development_dependency 'rspec', '3.6.0'
  s.add_development_dependency 'vcr', '3.0.3'
  s.add_development_dependency 'webmock', '3.1.0'
end
