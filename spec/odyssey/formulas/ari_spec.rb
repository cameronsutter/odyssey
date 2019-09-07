require 'spec_helper'

context 'Automated Readability Index' do
  describe '.ari' do
    subject { Odyssey.ari books(:on_the_duty_of_civil_disobedience) }

    it { is_expected.to_not eq nil }

    it 'should return the score' do
      expect(subject).to eq 13.2
    end
  end
end
