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

def one_complex_sentence
  "The quick brown fox jumps over the lazy dog."
end

def two_complex_sentences
  "The quick brown fox jumps over the lazy dog. Peter Piper picked a peck of pickled peppers."
end

def very_complex
  "The best things in an artist's work are so much a matter of intuition, that there is much to be said for the point of view that would altogether discourage intellectual inquiry into artistic phenomena on the part of the artist. Intuitions are shy things and apt to disappear if looked into too closely. And there is undoubtedly a danger that too much knowledge and training may supplant the natural intuitive feeling of a student, leaving only a cold knowledge of the means of expression in its place. For the artist, if he has the right stuff in him"
end