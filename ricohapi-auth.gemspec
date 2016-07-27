# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ricohapi/auth/version'

Gem::Specification.new do |spec|
  spec.name          = "ricohapi-auth"
  spec.version       = RicohAPI::Auth::VERSION
  spec.authors       = ['Ricoh Company, Ltd.']

  spec.summary       = %q{Ricoh Auth Client}
  spec.description   = %q{Ricoh Auth Client in Ruby}
  spec.homepage      = 'https://github.com/ricohapi/auth-rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rack-oauth2', '>= 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
  spec.add_runtime_dependency 'json-jwt'
end
