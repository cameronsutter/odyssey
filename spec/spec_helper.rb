require 'rspec'
require 'odyssey'

require 'pathname'
require 'yaml'

require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/object/blank'

PENDING_TEXTS = [
  'If'
]

module Helpers
end

def fixture_texts
  Dir.glob("#{Pathname.new(__dir__).realpath + 'fixtures'}/*.yml").map do |f|
   YAML.load_file(f).deep_symbolize_keys
  end.reject do |text|
    PENDING_TEXTS.include? text[:title]
  end.each do |text|
    text[:text] = text[:text].strip if text[:text].present?
  end
end

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
  c.expect_with(:rspec) { |c| c.syntax = :expect }
  c.include Helpers
end
