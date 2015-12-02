module Odyssey
  class Engine

    #instance variables
    @formula
    @score
    @stats
    @words
    @sentences
    @syllables
    @data

    #regex
    LETTER_REGEX = /[A-z]/
    WORD_REGEX = /[^\W][A-z\-']*/
    SENTENCE_REGEX = /[^\.!?\s][^\.!?]*(?:[\.!?](?!['"]?\s|$)[^\.!?]*)*[\.!?]?['"]?(?=\s|$)/

    #words that cause the syllable analyzer to fail
    # word => syllables
    PROBLEM_WORDS = {
      'ion'    => 2
    }

    def initialize(formula_name)
      reset
      update_formula(formula_name)
    end

    def update_formula(formula_name)
      klass = Module.const_get formula_name
      @formula = klass.new
    rescue
      @formula = Formula.new
    end

    def score(_text, analyze = true)
      if analyze
        #sanitize the text
        text = sanitize(_text)

        #first get all the statistics
        @stats = {
          'string_length' => string_length(text),
          'letter_count' => letter_count(text),
          'word_count' => word_count(text),
          'syllable_count' => syllable_count(text),
          'sentence_count' => sentence_count(text),
        }

        @stats['average_words_per_sentence'] = average_words_per_sentence(text)
        @stats['average_syllables_per_word'] = average_syllables_per_word(text)

        #prepare the parameter to the score method
        @data = {
          'raw' => text,
          'words' => @words,
          'sentences' => @sentences,
          'syllables' => @syllables
        }
      end

      #now run all that through the formula
      @score = @formula.score(@data, @stats)
    end

    def string_length(text)
      text.length
    end

    def letter_count(text)
      matches = text.scan LETTER_REGEX
      matches.size
    end

    def syllable_count(text)
      count = 0
      @words.each do |w|
        num = analyze_syllables(w)
        count += num
        @syllables << num
      end
      count
    end

    def word_count(text)
      @words = text.scan WORD_REGEX
      @words.size
    end

    def sentence_count(text)
      @sentences = text.scan SENTENCE_REGEX
      @sentences.size
    end

    def average_words_per_sentence(text)
      @stats['word_count'].to_f / @stats['sentence_count'].to_f
    end

    def average_syllables_per_word(text)
      @stats['syllable_count'].to_f / @stats['word_count'].to_f
    end

    # for now this just removes html tags
    # but it could do more in the future
    def sanitize(text)
      output = text.gsub(/<\/?[^>]+>/, '')
    end

    def analyze_syllables(_word)
      #remove non-alpha characters
      word = _word.gsub(/[^A-z]/, '')
      count = 0

      if PROBLEM_WORDS.has_key?(word)
        count = PROBLEM_WORDS[word]
      else
        #this is an approximation, but it is fairly close
        word.downcase!
        return 1 if word.length <= 3
        word.sub!(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '')
        word.sub!(/^y/, '')
        count = word.scan(/[aeiouy]{1,2}/).size
      end

      count
    end

    def get_stats
      { 
        'name'           => @formula.name,
        'formula'        => @formula,
        'score'          => @score,
        'string_length'  => @stats['string_length'],
        'letter_count'   => @stats['letter_count'],
        'syllable_count' => @stats['syllable_count'],
        'word_count'     => @stats['word_count'],
        'sentence_count' => @stats['sentence_count'],
        'average_words_per_sentence' => @stats['average_words_per_sentence'],
        'average_syllables_per_word' => @stats['average_syllables_per_word']
      }
    end

    def reset
      @formula = nil
      @score = 0
      @stats = {}
      @words = nil
      @sentences = nil
      @syllables = []
    end

  end
end
