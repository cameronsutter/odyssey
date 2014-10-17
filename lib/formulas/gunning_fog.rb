class GunningFog < Formula

  def score(text, stats)
    percent = three_syllables(stats['word_count'], text['syllables'])
    calc_score(stats['average_words_per_sentence'], percent)
  end

  #percentage of words with three syllables
  def three_syllables(word_count, syllables)
    with_three = 0
    syllables.each do |s|
      with_three += 1 if s > 2
    end
    (with_three / word_count) * 100
  end

  def calc_score(avg_words, percent_with_three)
    ((avg_words + percent_with_three) * 0.4).round(1)
  end

  def name
    'Gunning-Fog Score'
  end
end