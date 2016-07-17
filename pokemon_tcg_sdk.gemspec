# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pokemon_tcg_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "pokemon_tcg_sdk"
  spec.version       = Pokemon::VERSION
  spec.authors       = ["Andrew Backes"]
  spec.email         = ["backes.andrew@gmail.com"]
  spec.summary       = "Pokémon TCG SDK for pokemontcg.io"
  spec.description   = "Pokémon TCG SDK is a wrapper around the Pokémon TCG API located at pokemontcg.io"
  spec.homepage      = "https://pokemontcg.io"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 11.2"
  spec.add_development_dependency "minitest", "~> 5.9"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.1"
  spec.add_development_dependency "simplecov", "~> 0.12"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.6"

  spec.add_dependency "roar", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
  spec.add_dependency "multi_json", "~> 1.12"
  spec.add_dependency "multi_xml", "~> 0.5"
  spec.add_dependency "faraday_middleware", "~> 0.10"
end
