class ColemanLiau < Formula

  def score(text, stats)
    calc_score(stats['letter_count'], stats['word_count'], stats['sentence_count'])
  end

  def calc_score(letter_count, word_count, sentence_count)
    ((5.89 * (letter_count.to_f / word_count.to_f)) - (0.3 * (sentence_count.to_f / word_count.to_f)) - 15.8).round(1)
  end

  def name
    'Coleman-Liau Index'
  end
end