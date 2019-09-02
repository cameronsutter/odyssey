require 'odyssey'
require 'rspec'
require 'aruba/rspec'
require 'pathname'

module Helpers
  def cli_gem_root
    (Pathname.new(__dir__) + '..').realpath
  end
end

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
  c.expect_with(:rspec) { |c| c.syntax = %i[expect] }
  c.include Helpers
end
