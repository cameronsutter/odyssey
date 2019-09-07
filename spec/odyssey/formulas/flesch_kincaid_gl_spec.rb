require 'spec_helper'

context 'Flesch-Kincaid Grade Level' do
  describe '.flesch_kincaid_gl' do
    subject do
      Odyssey.flesch_kincaid_gl books(:on_the_duty_of_civil_disobedience)
    end

    it { is_expected.to_not eq nil }

    it 'should return the score' do
      expect(subject).to eq 12.3
    end
  end
end
