require 'spec_helper'

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
