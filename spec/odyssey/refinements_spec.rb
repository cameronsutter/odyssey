require 'spec_helper'

using Odyssey::Refinements

describe Odyssey::Refinements do
  describe String do
    describe '#readability' do
      it "calls Odyssey#analyze_all" do
        expect(Odyssey).to receive(:analyze_all).with(one_simple_sentence)
        one_simple_sentence.readability
      end
    end
  end
end