require 'rspec'
require 'odyssey'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end

def one_simple_sentence
  "See Spot run."
end

def two_simple_sentences
  "See Spot run. See Spot jump."
end