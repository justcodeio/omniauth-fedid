# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/fedid/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-fedid"
  spec.version       = Omniauth::Fedid::VERSION
  spec.authors       = ["Filip Stybel", "Michal Andros"]
  spec.email         = ["filip.stybel@justcode.io", "michalandros@gmail.com"]

  spec.summary       = %q{Oauth strategy for FEDID}
  spec.description   = %q{log in using FEDID via Oauth}
  spec.homepage      = "https://github.com/justcodeio/omniauth-fedid"
  spec.license       = "MIT"
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.3.11"
  spec.add_development_dependency "rake", "~> 13.0.6"
  spec.add_development_dependency "rspec", "~> 3.11"
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'webmock'
  spec.add_runtime_dependency 'omniauth', '~> 2.0', '>= 2.0.4'
  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.7.2'
end
