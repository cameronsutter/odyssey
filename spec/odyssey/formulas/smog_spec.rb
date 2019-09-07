# frozen_string_literal: true

require 'spec_helper'

fixture_texts.each do |text|
  context 'SMOG Index' do
    describe '.smog' do
      subject { Odyssey.smog text[:text] }

      it { is_expected.to_not eq nil }

      it 'should return the score' do
        expect(subject).to eq text[:scores][:smog]
      end
    end
  end
end
