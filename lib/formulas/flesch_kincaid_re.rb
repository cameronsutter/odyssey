class Flesch_kincaid_RE < Formula

  def score(text, stats)
    get_score(stats['average_words_per_sentence'], stats['average_syllables_per_word'])
  end

  def get_score(avg_words, avg_syllables)
    ((206.835 - (1.015 * avg_words)) - (84.6 * avg_syllables)).round(1)
  end

  def name
    'Flesch-Kincaid Reading Ease'
  end
end