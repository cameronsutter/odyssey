require 'spec_helper'

context 'Coleman-Liau Index' do
  describe '.coleman_liau ' do
    subject { Odyssey.coleman_liau books(:on_the_duty_of_civil_disobedience) }

    it { is_expected.to_not eq nil }

    it 'should return the score' do
      expect(subject).to eq 9.4
    end
  end
end

