class Smog < Formula

  def score(text, stats)
    with_three = three_syllables(text['syllables'])
    calc_score(stats['sentence_count'], with_three)
  end

  def three_syllables(syllables)
    with_three = 0
    syllables.each do |s|
      with_three += 1 if s > 2
    end
    with_three
  end

  def calc_score(sentence_count, with_three)
    (1.043 * Math.sqrt(with_three * (30.0 / sentence_count)) + 3.1291).round(1)
  end

  def name
    'SMOG Index'
  end
end