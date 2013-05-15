# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'odyssey/version'

Gem::Specification.new do |spec|
  spec.name          = "odyssey"
  spec.version       = Odyssey::VERSION
  spec.authors       = ["Cameron Sutter"]
  spec.email         = ["cameronsutter0@gmail.com"]
  spec.description   = %q{TODO: Text readability analyzer}
  spec.summary       = %q{TODO: Uses readibility formulas (e.g. Flesch-Kincaid) to analze text and give a score}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.add_dependency "require_all"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
