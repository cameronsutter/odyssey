class Ari < Formula

  def score(text, stats)
    calc_score(stats['letter_count'], stats['word_count'], stats['sentence_count'])
  end

  def score_by_sentence(text_split, stats_split)
    res = []
    for i in 0..text_split['sentences'].length-1
      res.push(calc_score(stats_split['letter_count'][i],
                          stats_split['word_count'][i],
                          1))
    end
    res
  end

  def calc_score(letter_count, word_count, sentence_count)
    (((4.71 * (letter_count.to_f / word_count.to_f)) + (0.5 * (word_count.to_f / sentence_count.to_f))) - 21.43).round(1)
  end

  def name
    'Automated Readability Index'
  end
end
