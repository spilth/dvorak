# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dvorak/version'

Gem::Specification.new do |spec|
  spec.name          = "dvorak"
  spec.version       = Dvorak::VERSION
  spec.authors       = ["Brian Kelly"]
  spec.email         = ["polymonic@gmail.com"]
  spec.description   = %q{Create Dvorak deck PDFs using YAML files.}
  spec.summary       = %q{Dvorak decks with Ruby!}
  spec.homepage      = "https://github.com/spilth/dvorak"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_dependency 'prawn'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'rake'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pdf-reader'

end
