# frozen_string_literal: true

require 'spec_helper'

fixture_texts.each do |text|
  context 'Gunning-Fog Score' do
    describe '.gunning_fog' do
      subject { Odyssey.gunning_fog text[:text] }

      it { is_expected.to_not eq nil }

      it 'should return the score' do
        expect(subject).to eq text[:scores][:gunning_fog]
      end
    end
  end
end
