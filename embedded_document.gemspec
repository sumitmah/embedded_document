# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'embedded_document/version'

Gem::Specification.new do |spec|
  spec.name          = 'embedded_document'
  spec.version       = EmbeddedDocument::VERSION
  spec.authors       = ['Sumit Mahamuni', 'Rahul Phulore']
  spec.email         = ['mahamunisumit@gmail.com']
  spec.summary       = %q{Convenient way of dealing with JSON documents in web apps}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.6'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-debugger'
end
