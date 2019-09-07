# frozen_string_literal: true

require 'spec_helper'

fixture_texts.each do |text|
  context 'Flesch-Kincaid Grade Level' do
    describe '.flesch_kincaid_gl' do
      subject { Odyssey.flesch_kincaid_gl text[:text] }

      it { is_expected.to_not eq nil }

      it 'should return the score' do
        expect(subject).to eq text[:scores][:flesch_kincaid_grade_level]
      end
    end
  end
end
