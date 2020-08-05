require "rspec"
require "rspec/its"

RSpec.configure do |config|
  config.color     = true
  config.formatter = "documentation"
  config.expect_with(:rspec) { |c| c.syntax = %i[expect] }
end

require "odyssey"
