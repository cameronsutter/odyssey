require 'spec_helper'

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
      @simple.should == 3.1
      @double.should == 3.1
      @complex.should == 3.1
      @complex_double.should == 3.1
      @very_complex.should == 13.8
    end
  end

end
