# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'odyssey/version'

Gem::Specification.new do |spec|
  spec.name          = "odyssey"
  spec.version       = Odyssey::VERSION
  spec.authors       = ["Cameron Sutter"]
  spec.email         = ["cameronsutter0@gmail.com"]
  spec.description   = %q{Odyssey is an extendible text analyzing gem that outputs the readability score of text. It has several of the common readability formulas available, but defaults to the Flesch-Kincaid Reading Ease score.}
  spec.summary       = %q{Text readability analyzer using Flesch-Kincaid and others}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.add_dependency "require_all", "~> 2.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "pry"
end
