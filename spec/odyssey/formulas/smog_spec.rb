require 'spec_helper'

context 'SMOG Index' do
  describe '.smog' do
    subject { Odyssey.smog books(:on_the_duty_of_civil_disobedience) }

    it { is_expected.to_not eq nil }

    it 'should return the score' do
      expect(subject).to eq 17.1
    end
  end
end
