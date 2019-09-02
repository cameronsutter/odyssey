# frozen_string_literal: true

require 'odyssey'
require 'terminal-table'
require 'thor'

module Odyssey
  module CLI
    class CLI < Thor
      PROGRAM_NAME = 'odyssey'

      SCORES = {
        'ari'          => {
          method: :ari,
          name: 'Automated Readability Index',
          key: '1          => Kindergarten  | 8         => 7th Grade  | 14+       => College Level',
          class: 'Ari'
        },
        'coleman-liau' => {
          method: :coleman_liau,
          name: 'Coleman Liau Index',
          key: '1          => Kindergarten  | 8         => 7th Grade  | 14+       => College Level',
          class: 'ColemanLiau'
        },
        'grade-level'  => {
          method: :flesch_kincaid_gl,
          name: 'Flesch Kincaid Grade Level',
          key: '1          => Kindergarten  | 8         => 7th Grade  | 14+       => College Level',
          class: 'FleshKincaidGl'
        },
        'reading-ease' => {
          method: :flesch_kincaid_re,
          name: 'Flesch Kincaid Reading Ease',
          key: '7          => 7th grade     | 10        => 10th Grade | 13-16     => College Level',
          class: 'FleshKincaidRe'
        },
        'gunning-fog'  => {
          method: :gunning_fog,
          name: 'Gunning Fog Index',
          key: '7          => 7th grade     | 10        => 10th Grade | 13-16     => College Level',
          class: 'GunningFog'
        },
        'smog'         => {
          method: :smog,
          name: 'Smog Index',
          key: '100.0-90.0 => 5th Grade     | 80.0-70.0 => 7th Grade  | 50.0-30.0 => College Level',
          class: 'Smog'
        }
      }.freeze

      desc 'score <TEXT_FILE>', 'output scores/metrics for a file'
      option :formulas,
             aliases: '-f',
             type: :array,
             desc: 'Formulas to compute (space-separated)',
             default: SCORES.keys,
             enum: SCORES.keys
      def score text_file
        puts "\nChecking the contents of #{text_file} ...\n\n"

        content = File.read text_file

        results = Odyssey.analyze_multi \
          content,
          options[:formulas].map { |f| SCORES[f][:class] },
          true

        headers = %w[Name Score Interpretation]

        rows = options[:formulas].map do |f|
          [
            SCORES[f][:name],
            results['scores'][SCORES[f][:class]],
            SCORES[f][:key]
          ]
        end

        table = Terminal::Table.new headings: headers, rows: rows

        puts table, "\n"
      rescue StandardError => e
        puts "\n`#{PROGRAM_NAME}` has encountered an error.\n"
        puts "#{e.message}: \n#{e.backtrace}"
      end
    end
  end
end
