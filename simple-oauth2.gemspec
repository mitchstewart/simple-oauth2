# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple/oauth2/version'

Gem::Specification.new do |spec|
  spec.name          = "simple-oauth2"
  spec.version       = Simple::Oauth2::VERSION
  spec.authors       = ["Mitch Stewart"]
  spec.email         = ["mitch.stewart.io@gmail.com"]

  spec.summary       = %q{A simple oauth2 client.}
  spec.description   = %q{No fuss, weird stuff, or oddities. Just an oauth2 client.}
  spec.homepage      = "https://github.com/mitchstewart/simple-oauth2"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "faraday", "~> 0.9.2"
  spec.add_development_dependency 'addressable', '~> 2.5', '>= 2.5.1'
end