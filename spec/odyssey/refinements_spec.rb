require "spec_helper"

using Odyssey::Refinements

describe Odyssey::Refinements do
  describe String do
    describe "#readability" do
      let(:quote) do
        "Scripting is a lot like obscenity.\n" \
        "I can’t define it, but I’ll know it when I see it"
      end

      it "calls Odyssey#analyze_all" do
        expect(quote.readability).to eq(Odyssey.analyze(quote))
      end
    end
  end
end
