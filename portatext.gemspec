Gem::Specification.new do |s|
  s.name        = 'portatext'
  s.version     = '1.4.4'
  s.summary     = 'Official PortaText API ruby client'
  s.description = 'This is the official PortaText API ruby client'
  s.authors     = ['PortaText']
  s.email       = 'hello@portatext.com'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.require_paths = ['lib']
  s.homepage    = 'http://rubygems.org/gems/portatext'
  s.license     = 'Apache-2.0'
  s.add_development_dependency 'simplecov', '~> 0.11'
  s.add_development_dependency 'coveralls', '~> 0.8'
  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'minitest', '~> 5.8'
  s.add_development_dependency 'rubocop', '~> 0.35'
  s.add_development_dependency 'bundler-audit', '~> 0.4'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
end
