# frozen_string_literal: true

require 'spec_helper'

fixture_texts.each do |text|
  describe Odyssey do
    describe '.analyze' do
      context 'with no args' do
        subject { Odyssey.analyze text[:text] }

        it 'outputs the FleschKincaid Reading Ease score' do
          expect(subject).to eq text[:scores][:flesch_kincaid_reading_ease]
        end
      end

      context 'with no formulas provided, and `all_stats = true`' do
        subject { Odyssey.analyze text[:text], nil, true }

        describe "['name']" do
          it 'returns formula name' do
            expect(subject['name']).to eq 'Flesch-Kincaid Reading Ease'
          end
        end

        describe "['score']" do
          it 'returns the score' do
            expect(subject['score']).to \
              eq text[:scores][:flesch_kincaid_reading_ease]
          end
        end

        describe "['formula']" do
          it 'returns the formula class' do
            expect(subject['formula'].class.to_s).to eq 'FleschKincaidRe'
          end
        end

        describe "['string_length']" do
          it 'returns the number of characters (including whitespace)' do
            expect(subject['string_length']).to \
              eq text[:data][:string_length]
          end
        end

        describe "['letter_count']" do
          it 'returns the number of letters' do
            expect(subject['letter_count']).to eq text[:data][:letter_count]
          end
        end

        describe "['syllable_count']" do
          it 'returns the number of syllables' do
            expect(subject['syllable_count']).to \
              eq text[:data][:syllable_count]
          end
        end

        describe "['word_count']" do
          it 'returns the number of words' do
            expect(subject['word_count']).to eq text[:data][:word_count]
          end
        end

        describe "['sentence_count']" do
          it 'returns the number of sentences' do
            expect(subject['sentence_count']).to \
              eq text[:data][:sentence_count]
          end
        end

        describe "['average_words_per_sentence']" do
          it 'returns the average words per sentences' do
            expect(subject['average_words_per_sentence']).to \
              be_within(0.01).of(text[:data][:average_words_per_sentence])
          end
        end

        describe "['average_syllables_per_word']" do
          it 'returns the average syllables per word' do
            expect(subject['average_syllables_per_word']).to \
              be_within(0.01).of(text[:data][:average_syllables_per_word])
          end
        end
      end

      context 'with multiple formulas provided, and `all_stats = true`' do
        let :scores do
          %w[
            Ari
            ColemanLiau
            FleschKincaidGl
            FleschKincaidRe
            GunningFog
            Smog
          ]
        end
        subject { Odyssey.analyze_multi text[:text], scores, true }

        describe "['FormulaClass']" do
          it 'returns the score' do
            expect(subject['scores']['Ari']).to \
              eq text[:scores][:ari]
            expect(subject['scores']['ColemanLiau']).to \
              eq text[:scores][:coleman_liau]
            expect(subject['scores']['FleschKincaidGl']).to \
              eq text[:scores][:flesch_kincaid_grade_level]
            expect(subject['scores']['FleschKincaidRe']).to \
              eq text[:scores][:flesch_kincaid_reading_ease]
            expect(subject['scores']['GunningFog']).to \
              eq text[:scores][:gunning_fog]
            expect(subject['scores']['Smog']).to \
              eq text[:scores][:smog]
          end
        end

        describe "['string_length']" do
          it 'returns the number of characters (including whitespace)' do
            expect(subject['string_length']).to eq text[:data][:string_length]
          end
        end

        describe "['letter_count']" do
          it 'returns the number of letters' do
            expect(subject['letter_count']).to eq text[:data][:letter_count]
          end
        end

        describe "['syllable_count']" do
          it 'returns the number of syllables' do
            expect(subject['syllable_count']).to eq text[:data][:syllable_count]
          end
        end

        describe "['word_count']" do
          it 'returns the number of words' do
            expect(subject['word_count']).to eq text[:data][:word_count]
          end
        end

        describe "['sentence_count']" do
          it 'returns the number of sentences' do
            expect(subject['sentence_count']).to eq text[:data][:sentence_count]
          end
        end

        describe "['average_words_per_sentence']" do
          it 'returns the average words per sentences' do
            expect(subject['average_words_per_sentence']).to \
              eq text[:data][:average_words_per_sentence]
          end
        end

        describe "['average_syllables_per_word']" do
          it 'returns the average syllables per word' do
            expect(subject['average_syllables_per_word']).to \
              eq text[:data][:average_syllables_per_word]
          end
        end
      end
    end
  end
end
