# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'discographies/version'

Gem::Specification.new do |gem|
  gem.name          = "discographies"
  gem.version       = Discographies::VERSION
  gem.authors       = ["Jens Fahnenbruck"]
  gem.email         = ["jigfox@me.com"]
  gem.description   = %q{discogs api client}
  gem.summary       = %q{discogs api client for the json api v2}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "faraday", "~> 0.8.4"
  gem.add_dependency "faraday_middleware", "~> 0.8.8"

  gem.add_development_dependency "activesupport"
  gem.add_development_dependency "rspec", "~> 2.11.0"
  gem.add_development_dependency "webmock", "~> 1.8.10"
  gem.add_development_dependency "vcr", "~> 2.2.5"
end
