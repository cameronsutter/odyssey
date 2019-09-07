# frozen_string_literal: true

require 'spec_helper'

fixture_texts.each do |text|
  context 'Coleman-Liau Index' do
    describe '.coleman_liau ' do
      subject { Odyssey.coleman_liau text[:text] }

      it { is_expected.to_not eq nil }

      it 'should return the score' do
        expect(subject).to eq text[:scores][:coleman_liau]
      end
    end
  end
end
