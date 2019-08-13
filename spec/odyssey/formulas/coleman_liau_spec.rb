require 'spec_helper'

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

