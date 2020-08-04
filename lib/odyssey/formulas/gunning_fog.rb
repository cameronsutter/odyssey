class GunningFog < Odyssey::Formula
  def score(text, stats)
    percent = three_syllables(stats['word_count'], text['syllables'])
    calc_score(stats['average_words_per_sentence'], percent)
  end

  def score_per_sentence(text, stats_split)
    res = []
    for i in 0..text['sentences'].length-1
      percent = three_syllables(stats_split['word_count'][i],
                                text['syllables_by_sentence'][i])
      res.push(calc_score(stats_split['word_count'][i], percent))
    end
    res
  end

  #percentage of words with three syllables
  def three_syllables(word_count, syllables)
    with_three = 0
    syllables.each do |s|
      with_three += 1 if s > 2
    end
    (with_three / word_count) * 100
  end

  def name
    'Gunning-Fog Score'
  end

  private

  def calc_score(avg_words, percent_with_three)
    ((avg_words + percent_with_three) * 0.4).round(1)
  end
end
