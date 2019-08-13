require 'spec_helper'

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
