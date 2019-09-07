require 'spec_helper'

describe Odyssey do
  describe '.analyze' do
    context 'with no args' do
      subject { Odyssey.analyze books(:on_the_duty_of_civil_disobedience) }

      it 'outputs the FleschKincaid Reading Ease score' do
        expect(subject).to eq 58.2
      end
    end

    context 'with no formulas provided, and `all_stats = true`' do
      subject do
        Odyssey.analyze books(:on_the_duty_of_civil_disobedience), nil, true
      end

      describe "['name']" do
        it 'returns formula name' do
          expect(subject['name']).to eq 'Flesch-Kincaid Reading Ease'
        end
      end

      describe "['score']" do
        it 'returns the score' do
          expect(subject['score']).to eq 58.2
        end
      end

      describe "['formula']" do
        it 'returns the formula class' do
          expect(subject['formula'].class.to_s).to eq 'FleschKincaidRe'
        end
      end

      describe "['string_length']" do
        it 'returns the number of characters (including whitespace)' do
          expect(subject['string_length']).to eq 51_258
        end
      end

      describe "['letter_count']" do
        it 'returns the number of letters' do
          expect(subject['letter_count']).to eq 40_320
        end
      end

      describe "['syllable_count']" do
        it 'returns the number of syllables' do
          expect(subject['syllable_count']).to eq 13_259
        end
      end

      describe "['word_count']" do
        it 'returns the number of words' do
          expect(subject['word_count']).to eq 9_406
        end
      end

      describe "['sentence_count']" do
        it 'returns the number of sentences' do
          expect(subject['sentence_count']).to eq 325
        end
      end

      describe "['average_words_per_sentence']" do
        it 'returns the average words per sentences' do
          expect(subject['average_words_per_sentence']).to eq 28.94153846153846
        end
      end

      describe "['average_syllables_per_word']" do
        it 'returns the average syllables per word' do
          expect(subject['average_syllables_per_word']).to eq 1.4096321496916862
        end
      end
    end

    context 'with multiple formulas provided, and `all_stats = true`' do
      subject do
        Odyssey.analyze_multi \
          books(:on_the_duty_of_civil_disobedience),
          %w[
            Ari
            ColemanLiau
            FleschKincaidGl
            FleschKincaidRe
            GunningFog
            Smog
          ],
          true
      end

      describe "['FormulaClass']" do
        it 'returns the score' do
          expect(subject['scores']['Ari']).to eq 13.2
          expect(subject['scores']['ColemanLiau']).to eq 9.4
          expect(subject['scores']['FleschKincaidGl']).to eq 12.3
          expect(subject['scores']['FleschKincaidRe']).to eq 58.2
          expect(subject['scores']['GunningFog']).to eq 11.6
          expect(subject['scores']['Smog']).to eq 17.1
        end
      end

      describe "['string_length']" do
        it 'returns the number of characters (including whitespace)' do
          expect(subject['string_length']).to eq 51_258
        end
      end

      describe "['letter_count']" do
        it 'returns the number of letters' do
          expect(subject['letter_count']).to eq 40_320
        end
      end

      describe "['syllable_count']" do
        it 'returns the number of syllables' do
          expect(subject['syllable_count']).to eq 13_259
        end
      end

      describe "['word_count']" do
        it 'returns the number of words' do
          expect(subject['word_count']).to eq 9_406
        end
      end

      describe "['sentence_count']" do
        it 'returns the number of sentences' do
          expect(subject['sentence_count']).to eq 325
        end
      end

      describe "['average_words_per_sentence']" do
        it 'returns the average words per sentences' do
          expect(subject['average_words_per_sentence']).to eq 28.94153846153846
        end
      end

      describe "['average_syllables_per_word']" do
        it 'returns the average syllables per word' do
          expect(subject['average_syllables_per_word']).to eq 1.4096321496916862
        end
      end
    end
  end
end
