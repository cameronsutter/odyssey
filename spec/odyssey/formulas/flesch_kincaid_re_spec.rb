# frozen_string_literal: true

require 'spec_helper'

fixture_texts.each do |text|
  context 'Flesch-Kincaid Reading Ease' do
    describe '.flesch_kincaid_re' do
      subject { Odyssey.flesch_kincaid_re text[:text] }

      it { is_expected.to_not eq nil }

      it 'should return the score' do
        expect(subject).to eq text[:scores][:flesch_kincaid_reading_ease]
      end
    end
  end
end
