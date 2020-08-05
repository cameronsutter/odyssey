require "spec_helper"

def fake_scores name
  case name
  when :FleschKincaidRe then 1
  when :Ari             then 2
  else                       3
  end
end

module Odyssey
  Result = Struct.new(
    :formulas,
    :text,
    :scores,
    :letters,
    :keyword_init => true
  ) do
    def average_words_per_sentence
      3
    end

    def average_syllables_per_word
      3
    end

    def sentences
      text.chars
    end

    def syllables
      text.chars
    end

    def words
      text.chars
    end
  end

  def self.analyze text, formulas: [:FleschKincaidRe]
    raise ArgumentError, "no formula supplied" if formulas.empty?

    if formulas.include?(:all)
      formulas.delete(:all)
      formulas |= FORMULAS
    end

    Result.new(
      :formulas => formulas,
      :text     => text,
      :scores   => formulas.map { |f| {f => fake_scores(f)} }.reduce(:merge),
      :letters  => text.chars
    )
  end
end

describe Odyssey do
  describe ".analyze" do
    let(:sentence) { "Do unto others as you would have them do unto you." }

    it "raises an error if no formulas are supplied" do
      expect do
        Odyssey.analyze(sentence, :formulas => [])
      end.to raise_error(Odyssey::ArgumentError, /no formula supplied/)
    end

    it "defaults to the Flesch-Kincaid Reading Ease formula" do
      res = Odyssey.analyze(sentence)
      expect(res.formulas).to eq([:FleschKincaidRe])
    end

    it "uses all builtin formulas if `:all` if provided as a formula" do
      res = Odyssey.analyze(sentence, :formulas => %i[all Custom])
      expect(res.formulas).to eq([:Custom] + Odyssey::FORMULAS)
    end

    it "can accept formula instances" do
      f   = Odyssey::Formulas::FleschKincaidRe.new
      res = Odyssey.analyze(sentence, :formulas => [f])
      expect(res.formulas).to eq([f])
    end

    describe Odyssey::Result do
      subject { Odyssey.analyze(sentence) }

      its(:formulas)  { are_expected.to eq([:FleschKincaidRe]) }
      its(:text)      { is_expected.to eq(sentence) }
      its(:scores)    { are_expected.to eq(:FleschKincaidRe => 1) }
      its(:letters)   { are_expected.to eq(sentence.chars) }
      its(:syllables) { are_expected.to eq(sentence.chars) }
      its(:words)     { are_expected.to eq(sentence.chars) }
      its(:sentences) { are_expected.to eq(sentence.chars) }
      its(:average_words_per_sentence) { is_expected.to eq(3) }
      its(:average_syllables_per_word) { is_expected.to eq(3) }
    end
  end
end
