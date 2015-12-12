Gem::Specification.new do |s|
  s.name        = "portatext-sdk"
  s.version     = "0.0.1"
  s.summary     = "Official PortaText API ruby client"
  s.description = "This is the official PortaText API ruby client"
  s.authors     = ["PortaText"]
  s.email       = 'hello@portatext.com'
  s.files       = [
    "LICENSE",
    "lib/portatext-sdk.rb"
  ]
  s.homepage    = 'http://rubygems.org/gems/portatext-sdk'
  s.license     = 'Apache-2.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "minitest"
end
