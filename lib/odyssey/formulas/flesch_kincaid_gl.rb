class FleschKincaidGl < Odyssey::Formula

  def score(text, stats)
    calc_score(stats['average_words_per_sentence'], stats['average_syllables_per_word'])
  end

  def score_by_sentence(text, stats_split)
    res = []
    for i in 0..text['sentences'].length-1
      res.push(calc_score(stats_split['word_count'][i],
                          stats_split['average_syllables_per_word'][i]))
    end
    res
  end

  def name
    'Flesch-Kincaid Grade Level'
  end

  private

  def calc_score(avg_words, avg_syllables)
    (((0.39 * avg_words) + (11.8 * avg_syllables)) - 15.59).round(1)
  end
end
