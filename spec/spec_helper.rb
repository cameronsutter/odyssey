require 'rspec'
require 'odyssey'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end

def one_simple_sentence
  "See Spot run."
end