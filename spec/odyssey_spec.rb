require 'spec_helper'

describe Odyssey do
  it 'should return correct version string' do
    Odyssey.version_string.should == "#{Odyssey::VERSION}"
  end

  it 'should return something' do
    result = Odyssey.flesch_kincaid_reading_ease one_simple_sentence
    result.should_not be_nil
  end

  it 'should return the score' do
    result = Odyssey.flesch_kincaid_reading_ease one_simple_sentence
    result.should == one_simple_sentence
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