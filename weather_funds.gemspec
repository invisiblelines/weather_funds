# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weather_funds/version'

Gem::Specification.new do |gem|
  gem.name          = "weather_funds"
  gem.version       = WeatherFunds::VERSION
  gem.authors       = ["Kieran Johnson"]
  gem.email         = ["kieran@invisiblelines.com"]
  gem.description   = %q{Ruby interface to results from weatherfunds.co.uk}
  gem.summary       = %q{Ruby interface to results from weatherfunds.co.uk}
  gem.homepage      = "https://github.com/invisiblelines/weather_funds"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "nokogiri"
end