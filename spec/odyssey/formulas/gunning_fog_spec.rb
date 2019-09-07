require 'spec_helper'

context 'Gunning-Fog Score' do
  describe '.gunning_fog' do
    subject { Odyssey.gunning_fog books(:on_the_duty_of_civil_disobedience) }

    it { is_expected.to_not eq nil }

    it 'should return the score' do
      expect(subject).to eq 11.6
    end
  end
end
