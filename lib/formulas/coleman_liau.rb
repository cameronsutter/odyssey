class ColemanLiau < Formula

  def score(text, stats)
    calc_score(stats['letter_count'], stats['word_count'], stats['sentence_count'])
  end

  def score_by_sentence(text, stats_split)
    res = []
    for i in 0..text['sentences'].length-1
      res.push(calc_score(stats_split['letter_count'][i],
                          stats_split['word_count'][i],
                          1))
    end
  end

  def calc_score(letter_count, word_count, sentence_count)
    ((5.89 * (letter_count.to_f / word_count.to_f)) - (0.3 * (sentence_count.to_f / word_count.to_f)) - 15.8).round(1)
  end

  def name
    'Coleman-Liau Index'
  end
end
