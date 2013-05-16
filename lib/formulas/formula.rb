class Formula

  # stats will be a Hash like so:
  # {
  #   'string_length' => Fixnum,
  #   'letter_count' = Fixnum,
  #   'syllable_count' = Fixnum,
  #   'word_count' = Fixnum,
  #   'sentence_count' = Fixnum,
  #   'average_words_per_sentence' = Float,
  #   'average_syllables_per_word' = Float
  # }

  def score(text, stats)
    0
  end

  def name
    'Generic'
  end
end