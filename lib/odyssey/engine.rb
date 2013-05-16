module Odyssey
  class Engine

    #class variables
    @formula
    @score
    @stats

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
      klass = Module.const_get formula_name
      @formula = klass.new
    rescue
      @formula = Formula.new
    end

    def score(_text)
      #sanitize the text
      text = sanitize(_text)

      #first get the all the statistics
      @stats = {
        'string_length' => string_length(text),
        'letter_count' => letter_count(text),
        'syllable_count' => syllable_count(text),
        'word_count' => word_count(text),
        'sentence_count' => sentence_count(text)
      }
      @stats['average_words_per_sentence'] = average_words_per_sentence(text)
      @stats['average_syllables_per_word'] = average_syllables_per_word(text)

      #now run all that through the formula
      @score = @formula.score(text, @stats)
    end

    def string_length(text)
      text.length
    end

    def letter_count(text)
      match_count(text, LETTER_REGEX)
    end

    def syllable_count(text)
      count = 0
      words = text.scan WORD_REGEX
      words.each do |w|
        count += analyze_syllables(w)
      end
      count
    end

    def word_count(text)
      match_count(text, WORD_REGEX)
    end

    def sentence_count(text)
      match_count(text, SENTENCE_REGEX)
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

    def match_count(text, regex)
      matches = text.scan regex
      matches.size
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
        'sentence_count' => @stats['sentence_count'],
        'average_words_per_sentence' => @stats['average_words_per_sentence'],
        'average_syllables_per_word' => @stats['average_syllables_per_word']
      }
    end

    def reset
      @formula = nil
      @score = 0
      @stats = {}
    end

  end
end