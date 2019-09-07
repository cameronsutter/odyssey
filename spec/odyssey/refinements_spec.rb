require 'spec_helper'

using Odyssey::Refinements

describe Odyssey::Refinements do
  describe String do
    describe '#readability' do
      let(:simple_sentence) { 'This is an example sentence.' }

      it "calls Odyssey#analyze_all" do
        expect(Odyssey).to receive(:analyze_all).with(simple_sentence)
        simple_sentence.readability
      end
    end
  end
end
