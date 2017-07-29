# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pipe_envy/version'

Gem::Specification.new do |spec|
  spec.name          = "pipe_envy"
  spec.version       = PipeEnvy::VERSION
  spec.authors       = ["Nathan Hopkins"]
  spec.email         = ["natehop@gmail.com"]
  spec.summary       = "Elixir style pipe operator for Ruby"
  spec.homepage      = "https://github.com/hopsoft/pipe_envy"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.test_files    = Dir["test/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry-test"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "nokogiri"
end
