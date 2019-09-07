require 'spec_helper'

context 'Flesch-Kincaid Reading Ease' do
  describe '.flesch_kincaid_re' do
    subject do
      Odyssey.flesch_kincaid_re books(:on_the_duty_of_civil_disobedience)
    end

    it { is_expected.to_not eq nil }

    it 'should return the score' do
      expect(subject).to eq 58.2
    end
  end
end
