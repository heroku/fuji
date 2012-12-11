# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fuji/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Zeke Sikelianos"]
  gem.email         = ["zeke@sikelianos.com"]
  gem.description   = %q{heroku's site header}
  gem.summary       = %q{heroku's site header}
  gem.homepage      = "https://github.com/heroku/fuji"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fuji"
  gem.require_paths = ["lib"]
  gem.version       = Fuji::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
  
  gem.add_dependency "compass"
  gem.add_dependency "sass"
end