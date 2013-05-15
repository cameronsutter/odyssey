module Odyssey
  class Engine

    #class variables
    @formula
    @score
    @string_length
    @letter_count
    @syllable_count
    @sentence_count
    @average_words_per_sentence
    @average_syllables_per_word


    def initialize(formula_name)
      reset
      klass = Module.const_get formula_name
      @formula = klass.new
    end

    def score(text)
      #first get the all the statistics
      @string_length = string_length(text)
      @letter_count = letter_count(text)
      @syllable_count = syllable_count(text)
      @sentence_count = sentence_count(text)
      @average_words_per_sentence = average_words_per_sentence(text)
      @average_syllables_per_word = average_syllables_per_word(text)

      #now run all that through the formula
      @score = @formula.score(text, @string_length, @syllable_count, @sentence_count, @average_words_per_sentence, @average_syllables_per_word)
    end

    def string_length(text)
      text.length
    end

    def letter_count(text)

    end

    def syllable_count(text)

    end

    def sentence_count(text)

    end

    def average_words_per_sentence(text)

    end

    def average_syllables_per_word(text)

    end

    def get_stats
      { 
        'name'           => @formula.name,
        'formula'        => @formula,
        'score'          => @score,
        'string_length'  => @string_length,
        'letter_count'   => @letter_count,
        'syllable_count' => @syllable_count,
        'sentence_count' => @sentence_count,
        'sentence_count' => @sentence_count,
        'average_words_per_sentence' => @average_words_per_sentence,
        'average_syllables_per_word' => @average_syllables_per_word
      }
    end

    def reset
      @formula = nil
      @score = 0
      @string_length = 0
      @letter_count = 0
      @syllable_count = 0
      @sentence_count = 0
      @average_words_per_sentence = 0
      @average_syllables_per_word = 0
    end

  end
end