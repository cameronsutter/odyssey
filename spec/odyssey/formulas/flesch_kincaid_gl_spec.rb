require 'spec_helper'

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
