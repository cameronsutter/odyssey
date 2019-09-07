require 'rspec'
require 'odyssey'

require 'pathname'

module Helpers
  def books file_name
    File.read (Pathname.new(__dir__) + "fixtures/#{file_name}.md").realpath
  end
end

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
  c.expect_with(:rspec) { |c| c.syntax = :expect }
  c.include Helpers
end
