# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'odyssey cli', type: :aruba do
  def odyssey command_string = nil
    run_command "bundle exec ../../exe/odyssey #{command_string}"
  end

  describe '`score`' do
    context 'without arguments' do
      it 'errors and shows usage' do
        odyssey

        expect(last_command_stopped.output).to eq <<~CMD
          Commands:
            odyssey help [COMMAND]     # Describe available commands or one specific command
            odyssey score <TEXT_FILE>  # output scores/metrics for a file

        CMD
      end
    end

    context 'given a filename' do
      it 'shows all scores and metrics for the supplied file' do
        odyssey 'score ../../../LICENSE.txt'

        expect(last_command_stopped.output).to eq <<~CMD

          Checking the contents of ../../../LICENSE.txt ...

          +-----------------------------+-------+------------------------------------------------------------------------------------+
          | Name                        | Score | Interpretation                                                                     |
          +-----------------------------+-------+------------------------------------------------------------------------------------+
          | Automated Readability Index | 30.8  | 1          => Kindergarten  | 8         => 7th Grade  | 14+       => College Level |
          | Coleman Liau Index          | 13.4  | 1          => Kindergarten  | 8         => 7th Grade  | 14+       => College Level |
          | Flesch Kincaid Grade Level  | 0     | 1          => Kindergarten  | 8         => 7th Grade  | 14+       => College Level |
          | Flesch Kincaid Reading Ease | 0     | 7          => 7th grade     | 10        => 10th Grade | 13-16     => College Level |
          | Gunning Fog Index           | 23.1  | 7          => 7th grade     | 10        => 10th Grade | 13-16     => College Level |
          | Smog Index                  | 25.0  | 100.0-90.0 => 5th Grade     | 80.0-70.0 => 7th Grade  | 50.0-30.0 => College Level |
          +-----------------------------+-------+------------------------------------------------------------------------------------+

        CMD
      end
    end

    context 'given a filename and a set of formulas' do
      it 'shows only those scores and metrics for the supplied file' do
        odyssey 'score ../../../LICENSE.txt --formulas ari smog'

        expect(last_command_stopped.output).to eq <<~CMD

          Checking the contents of ../../../LICENSE.txt ...

          +-----------------------------+-------+------------------------------------------------------------------------------------+
          | Name                        | Score | Interpretation                                                                     |
          +-----------------------------+-------+------------------------------------------------------------------------------------+
          | Automated Readability Index | 30.8  | 1          => Kindergarten  | 8         => 7th Grade  | 14+       => College Level |
          | Smog Index                  | 25.0  | 100.0-90.0 => 5th Grade     | 80.0-70.0 => 7th Grade  | 50.0-30.0 => College Level |
          +-----------------------------+-------+------------------------------------------------------------------------------------+

        CMD
      end

      it 'also has a short `-f` option' do
        odyssey 'score ../../../LICENSE.txt -f grade-level reading-ease'

        expect(last_command_stopped.output).to eq <<~CMD

          Checking the contents of ../../../LICENSE.txt ...

          +-----------------------------+-------+------------------------------------------------------------------------------------+
          | Name                        | Score | Interpretation                                                                     |
          +-----------------------------+-------+------------------------------------------------------------------------------------+
          | Flesch Kincaid Grade Level  | 0     | 1          => Kindergarten  | 8         => 7th Grade  | 14+       => College Level |
          | Flesch Kincaid Reading Ease | 0     | 7          => 7th grade     | 10        => 10th Grade | 13-16     => College Level |
          +-----------------------------+-------+------------------------------------------------------------------------------------+

        CMD
      end
    end
  end

  describe 'help' do
    context 'without arguments' do
      it 'shows the basic help command' do
        odyssey 'help'

        expect(last_command_stopped.output).to eq <<~CMD
          Commands:
            odyssey help [COMMAND]     # Describe available commands or one specific command
            odyssey score <TEXT_FILE>  # output scores/metrics for a file

        CMD
      end
    end

    context '`score`' do
      it 'shows help for the `score` command' do
        odyssey 'help score'

        expect(last_command_stopped.output).to eq <<~CMD
          Usage:
            odyssey score <TEXT_FILE>

          Options:
            -f, [--formulas=one two three]  # Formulas to compute (space-separated)
                                            # Default: ["ari", "coleman-liau", "grade-level", "reading-ease", "gunning-fog", "smog"]
                                            # Possible values: ari, coleman-liau, grade-level, reading-ease, gunning-fog, smog

          output scores/metrics for a file
        CMD
      end
    end
  end
end
