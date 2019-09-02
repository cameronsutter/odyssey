# frozen_string_literal: true

require_relative 'lib/odyssey/cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'odyssey-cli'
  spec.version       = Odyssey::CLI::VERSION
  spec.authors       = ['Mark Delk']

  spec.summary       = 'CLI for the odyssey gem'
  spec.homepage      = 'https://github.com/cameronsutter/odyssey/cli'
  spec.license       = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new '>= 2.3.0'

  spec.metadata = {
    'allowed_push_host' => 'https://rubygems.org/',
    'homepage_uri'      => spec.homepage,
    'source_code_uri'   => spec.homepage
  }

  spec.files = Dir.chdir (Pathname.new(__dir__) + '..').realpath do
    `git ls-files -z --directory ./cli/`
      .split("\x0")
      .select { |f| f.match %r{^cli/} }
      .reject { |f| f.match %r{^(test|spec|features)/} }
      .map    { |f| f.sub 'cli/', '' }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename f }
  spec.require_paths = ['lib']

  {
    'odyssey'        => '~> 0.3.0',
    'terminal-table' => '~> 1.8',
    'thor'           => '~> 0.20.3'
  }.each do |gem, version|
    spec.add_dependency gem, version
  end

  {
    'aruba'      => '~> 0.14.11',
    'bundler'    => '~> 2.0',
    'pry'        => '~> 0.12.2',
    'pry-byebug' => '~> 3.7',
    'rake'       => '~> 12.3',
    'rspec'      => '~> 3.8',
    'rubocop'    => '~> 0.72.0'
  }.each do |gem, version|
    spec.add_development_dependency gem, version
  end
end
