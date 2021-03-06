# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sassfmt/version'

Gem::Specification.new do |spec|
  spec.name          = "sassfmt"
  spec.version       = Sassfmt::VERSION
  spec.authors       = ["Utkarsh Kukreti"]
  spec.email         = ["utkarshkukreti@gmail.com"]

  spec.summary       = %q{Sorts properties in your Sass files according to Twitter RECESS}
  spec.description   = %q{Sorts properties in your Sass files according to Twitter RECESS}
  spec.homepage      = "https://github.com/utkarshkukreti/sassfmt"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"

  spec.add_dependency "slop", "~> 4.2.1"
end
