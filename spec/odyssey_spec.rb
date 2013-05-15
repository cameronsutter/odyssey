require 'spec_helper'

describe Odyssey do

  context 'default formula' do
    it 'should return something' do
      result = Odyssey.analyze one_simple_sentence
      result.should_not be_nil
    end

    describe 'get all stats' do
      before do
        @simple = Odyssey.analyze one_simple_sentence, nil, true
        @double = Odyssey.analyze two_simple_sentences, nil, true
      end

      it 'should return string length' do
        @simple['string_length'].should == 13
      end

      it 'should return letter count' do
        @simple['letter_count'].should == 10
      end

      it 'should return syllable count' do
        @simple['syllable_count'].should == 3
      end

      it 'should return sentence count' do
        @simple['sentence_count'].should == 1

        @double['sentence_count'].should == 2
      end

      it 'should return average words per sentence' do
        @simple['average_words_per_sentence'].should == 3

        @double['average_words_per_sentence'].should == 3
      end

      it 'should return average syllables per word' do
        @simple['average_syllables_per_word'].should == 1

        @double['average_syllables_per_word'].should == 1
      end

    end
  end

  context 'flesch_kincaid_reading_ease' do
    it 'should return something' do
      result = Odyssey.flesch_kincaid_reading_ease one_simple_sentence
      result.should_not be_nil
    end

    describe 'get all stats' do
      before do
        @result = Odyssey.flesch_kincaid_reading_ease one_simple_sentence, true
      end

      it 'should return formula name' do
        @result['name'].should == 'Flesch-Kincaid Reading Ease'
      end

      it 'should return score' do
        @result['score'].should == one_simple_sentence
      end
    end
  end

  describe 'plugin formulas' do
    it 'should run any formula' do
      result = Odyssey.fake_formula one_simple_sentence, true
      result['name'].should == "It's fake"
    end
  end
end