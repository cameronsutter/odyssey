class FakeFormula < Formula

  def score(text, stats)
    text
  end

  def score_by_sentence(text, stats_split)
    text["sentences"]
  end

  def name
    "It's fake"
  end
end
