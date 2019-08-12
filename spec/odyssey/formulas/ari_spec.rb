require 'spec_helper'

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
