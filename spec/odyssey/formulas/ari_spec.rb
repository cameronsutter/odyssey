# frozen_string_literal: true

require 'spec_helper'

fixture_texts.each do |text|
  context 'Automated Readability Index' do
    describe '.ari' do
      subject { Odyssey.ari text[:text] }

      it { is_expected.to_not eq nil }

      it 'should return the score' do
        expect(subject).to eq text[:scores][:ari]
      end
    end
  end
end
