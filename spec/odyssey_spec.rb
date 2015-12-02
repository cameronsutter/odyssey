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

  context 'Flesch-Kincaid Reading Ease' do

    describe 'get score' do
      before :all do
        @simple = Odyssey.flesch_kincaid_re one_simple_sentence
        @double = Odyssey.flesch_kincaid_re two_simple_sentences
        @complex = Odyssey.flesch_kincaid_re one_complex_sentence
        @complex_double = Odyssey.flesch_kincaid_re two_complex_sentences
      end

      it 'should return something' do
        @simple.should_not be_nil
      end

      it 'should return the score' do
        @simple.should == 119.2
        @double.should == 119.2
        @complex.should == 94.3
        @complex_double.should == 88.7
      end
    end

  end

  context 'Flesch-Kincaid Grade Level' do

    describe 'get score' do
      before :all do
        @simple = Odyssey.flesch_kincaid_gl one_simple_sentence
        @double = Odyssey.flesch_kincaid_gl two_simple_sentences
        @complex = Odyssey.flesch_kincaid_gl one_complex_sentence
        @complex_double = Odyssey.flesch_kincaid_gl two_complex_sentences
      end

      it 'should return something' do
        @simple.should_not be_nil
      end

      it 'should return the score' do
        @simple.should == -2.6
        @double.should == -2.6
        @complex.should == 2.3
        @complex_double.should == 3
      end
    end

  end

  context 'Gunning-Fog Score' do

    describe 'get score' do
      before :all do
        @simple = Odyssey.gunning_fog one_simple_sentence
        @double = Odyssey.gunning_fog two_simple_sentences
        @complex = Odyssey.gunning_fog one_complex_sentence
        @complex_double = Odyssey.gunning_fog two_complex_sentences
      end

      it 'should return something' do
        @simple.should_not be_nil
      end

      it 'should return the score' do
        @simple.should == 1.2
        @double.should == 1.2
        @complex.should == 3.6
        @complex_double.should == 3.4
      end
    end

  end

  context 'Coleman-Liau Index' do

    describe 'get score' do
      before :all do
        @simple = Odyssey.coleman_liau one_simple_sentence
        @double = Odyssey.coleman_liau two_simple_sentences
        @complex = Odyssey.coleman_liau one_complex_sentence
        @complex_double = Odyssey.coleman_liau two_complex_sentences
        @very_complex = Odyssey.coleman_liau very_complex
      end

      it 'should return something' do
        @simple.should_not be_nil
      end

      it 'should return the score' do
        @simple.should == 3.7
        @double.should == 4.7
        @complex.should == 7.1
        @complex_double.should == 9.1
        @very_complex.should == 10.7
      end
    end

  end

  context 'SMOG Index' do

    describe 'get score' do
      before :all do
        @simple = Odyssey.smog one_simple_sentence
        @double = Odyssey.smog two_simple_sentences
        @complex = Odyssey.smog one_complex_sentence
        @complex_double = Odyssey.smog two_complex_sentences
        @very_complex = Odyssey.smog very_complex
      end

      it 'should return something' do
        @simple.should_not be_nil
      end

      it 'should return the score' do
        # @simple.should == 1.8
        # @double.should == 1.8
        # @complex.should == 1.8
        # @complex_double.should == 1.8
        # @very_complex.should == 10.1
      end
    end

  end

  context 'Automated Readability Index' do

    describe 'get score' do
      before :all do
        @simple = Odyssey.ari one_simple_sentence
        @double = Odyssey.ari two_simple_sentences
        @complex = Odyssey.ari one_complex_sentence
        @complex_double = Odyssey.ari two_complex_sentences
        @very_complex = Odyssey.ari very_complex
      end

      it 'should return something' do
        @simple.should_not be_nil
      end

      it 'should return the score' do
        @simple.should == -4.2
        @double.should == -3.4
        @complex.should == 1.4
        @complex_double.should == 2.8
        @very_complex.should == 12.1
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
        @double, @stats = Odyssey.analyze_multi two_simple_sentences, formula_names, true
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

      it 'should return some stats' do
        @stats['score'].should == 1.2
        @stats['name'].should == 'Gunning-Fog Score'
        @stats['word_count'].should == 6
      end
    end

    it 'should raise an error for empty formula list' do
      expect { Odyssey.analyze_multi one_simple_sentence, []}.to raise_error(ArgumentError)
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
