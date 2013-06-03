class Automated_readability < Formula

  def score(text, stats)
    calc_score(stats['letter_count'], stats['word_count'], stats['sentence_count'])
  end

  def calc_score(letter_count, word_count, sentence_count)
    (((4.71 * (letter_count.to_f / word_count.to_f)) + (0.5 * (word_count.to_f / sentence_count.to_f))) - 21.43).round(1)
  end

  def name
    'Automated Readability Index'
  end
end