module Odyssey
  class Formula

    # text will be a Hash like so:
    # data = {
    #   'raw' => String,
    #   'words' => Array,
    #   'sentences' => Array,
    #   'syllables' => Array
    # }
    #
    # stats will be a Hash like so:
    # {
    #   'string_length' => Fixnum,
    #   'letter_count' => Fixnum,
    #   'syllable_count' => Fixnum,
    #   'word_count' => Fixnum,
    #   'sentence_count' => Fixnum,
    #   'average_words_per_sentence' => Float,
    #   'average_syllables_per_word' => Float
    # }

    def score(text, stats)
      0
    end

    def score_by_sentence(text, stats_split)
      0
    end

    def name
      'Generic'
    end
  end
end
