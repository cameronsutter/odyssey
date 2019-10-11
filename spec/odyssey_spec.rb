require 'spec_helper'

describe Odyssey do

  context 'default formula' do
    it 'should return something' do
      result = Odyssey.analyze one_simple_sentence
      result.should_not be_nil
    end

    describe 'get all stats' do
      before :all do
        @simple = Odyssey.analyze one_simple_sentence, nil, true
        @double = Odyssey.analyze two_simple_sentences, nil, true
      end

      it 'should return formula name' do
        @simple['name'].should == 'Flesch-Kincaid Reading Ease'
      end

      it 'should return score' do
        @simple['score'].should == 119.2
      end

      it 'should return the formula' do
        @simple['formula'].class.to_s.should == 'FleschKincaidRe'
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

      it 'should return word count' do
        @simple['word_count'].should == 3

        @double['word_count'].should == 6
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

  context 'Run multiple formulas' do

    describe 'get scores' do
      before :all do
        formula_names = [ 'Ari',
                          'ColemanLiau',
                          'FleschKincaidGl',
                          'FleschKincaidRe',
                          'GunningFog']

        @simple = Odyssey.analyze_multi one_simple_sentence, formula_names
        @simple_stats = Odyssey.analyze_multi one_simple_sentence, formula_names, true
      end

      it 'should return something' do
        @simple.should_not be_nil
      end

      it 'should return the scores' do
        @simple['Ari'].should             == -4.2
        @simple['ColemanLiau'].should     == 3.7
        @simple['FleschKincaidGl'].should == -2.6
        @simple['FleschKincaidRe'].should == 119.2
        @simple['GunningFog'].should      == 1.2
      end

      it 'should return correct stats' do
        @simple_stats['string_length'].should  == 13
        @simple_stats['letter_count'].should   == 10
        @simple_stats['syllable_count'].should == 3
        @simple_stats['word_count'].should     == 3
        @simple_stats['sentence_count'].should == 1
        @simple_stats['average_words_per_sentence'].should == 3
        @simple_stats['average_syllables_per_word'].should == 1
      end

      it 'should include scores in the stats hash' do
        @simple_stats['scores']['Ari'].should             == -4.2
        @simple_stats['scores']['ColemanLiau'].should     == 3.7
        @simple_stats['scores']['FleschKincaidGl'].should == -2.6
        @simple_stats['scores']['FleschKincaidRe'].should == 119.2
        @simple_stats['scores']['GunningFog'].should      == 1.2
      end

      it 'should not include score in the stats hash' do
        @simple_stats['name'].should    be_nil
        @simple_stats['formula'].should be_nil
        @simple_stats['score'].should   be_nil
      end
    end

    it 'should raise an error for empty formula list' do
      expect { Odyssey.analyze_multi one_simple_sentence, [] }.to raise_error(ArgumentError)
    end
  end

  context 'Run all formulas' do
    describe 'get scores' do
      let :analyze_all do
        {
         'string_length' => 13,
         'letter_count' => 10,
         'syllable_count' => 3,
         'word_count' => 3,
         'sentence_count' => 1,
         'average_words_per_sentence' => 3.0,
         'average_syllables_per_word' => 1.0,
         'scores' => {
           'Ari' => -4.2,
           'ColemanLiau' => 3.7,
           'FleschKincaidGl' => -2.6,
           'FleschKincaidRe' => 119.2,
           'GunningFog' => 1.2,
           'Smog' => 3.1
          }
        }
      end

      it 'should call analyze_multi' do
        expect(Odyssey).to receive(:analyze_multi).with(one_simple_sentence, Array, true)
        Odyssey.analyze_all one_simple_sentence
      end

      it 'should return a Hash' do
        expect(Odyssey.analyze_all one_simple_sentence).to be_a Hash
      end

      it 'returns all scores and info' do
        expect(Odyssey.analyze_all one_simple_sentence).to eq analyze_all
      end
    end
  end

  describe 'plugin formulas' do
    it 'should run any formula using a shortcut method' do
      result = Odyssey.fake_formula one_simple_sentence, true
      result['name'].should == "It's fake"
    end

    it 'should raise an error for a formula that does not exist' do
      expect { Odyssey.no_existe one_simple_sentence, true }.to raise_error(NoMethodError)
    end
  end
end
