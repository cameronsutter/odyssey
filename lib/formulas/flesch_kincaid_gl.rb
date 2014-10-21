class FleschKincaidGl < Formula

  def score(text, stats)
    calc_score(stats['average_words_per_sentence'], stats['average_syllables_per_word'])
  end

  def calc_score(avg_words, avg_syllables)
    (((0.39 * avg_words) + (11.8 * avg_syllables)) - 15.59).round(1)
  end

  def name
    'Flesch-Kincaid Grade Level'
  end
end