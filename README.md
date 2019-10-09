# Odyssey

[![Gem Version](https://badge.fury.io/rb/odyssey.svg)](https://badge.fury.io/rb/odyssey)
[![Build Status](https://travis-ci.org/cameronsutter/odyssey.svg?branch=master)](https://travis-ci.org/cameronsutter/odyssey)

Odyssey is an extendible text analyzing gem that outputs the readability score of text. It has several of the common readability formulas available, but defaults to the Flesch-Kincaid Reading Ease score.

## Installation

Add this line to your application's Gemfile:

    gem 'odyssey'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install odyssey

## Usage

    require 'odyssey'

    Odyssey.formula_name(text, all_stats)

Example:

    Odyssey.flesch_kincaid_re("See Spot run.", true)

if `all_stats` is false, this returns a simple score. If it is true, it returns a Hash:


    {
      'name'                       => String,
      'formula'                    => formula_class,
      'score'                      => Float,
      'string_length'              => Fixnum,
      'letter_count'               => Fixnum,
      'syllable_count'             => Fixnum,
      'word_count'                 => Fixnum,
      'sentence_count'             => Fixnum,
      'average_words_per_sentence' => Float,
      'average_syllables_per_word' => Float
    }

You can also perform multiple analyses on the same text.  This is more efficient than calling each method separately as the initial text analysis (splitting up words, syllables, etc.) only needs to be performed once.

    Odyssey.analyze_multi(text, formula_names, all_stats)

Example:

    Odyssey.analyze_multi("See Spot run.", ['FleschKincaidRe', 'FleschKincaidGl'], true)

if all_stats is false, this returns a hash from formula name to score:

    {
        'FleschKincaidRe'  => 119.2,
        'FleschKincaidGl'  => -2.6
    }

if all_stats is true, this returns a Hash, similar to the Hash above:

    {
      'scores'                     => Hash,
      'string_length'              => Fixnum,
      'letter_count'               => Fixnum,
      'syllable_count'             => Fixnum,
      'word_count'                 => Fixnum,
      'sentence_count'             => Fixnum,
      'average_words_per_sentence' => Float,
      'average_syllables_per_word' => Float
    }

In order to get all stats and scores, you can use this shortcut:

    Odyssey.analyze_all(text)

or, using `Odyssey::Refinements`:

    using Odyssey::Refinements
    text.readability

## Extending Odyssey

To extend Odyssey, you can create a class that inherits from `Odyssey::Formula`.

    class CoolNewFormula < Odyssey::Formula

      def score(text, stats)
      end

      def name
        "Cool new formula"
      end
    end

text will be a Hash like so:

    data = {
      'raw' => String,
      'words' => Array,
      'sentences' => Array,
      'syllables' => Array
    }

stats will be a Hash like so:

    {
      'string_length' => Fixnum,
      'letter_count' => Fixnum,
      'syllable_count' => Fixnum,
      'word_count' => Fixnum,
      'sentence_count' => Fixnum,
      'average_words_per_sentence' => Float,
      'average_syllables_per_word' => Float
    }

That is all you need.
To call your formula you just use

    Odyssey.cool_new_formula('See Spot run.', true)

Because you have access to the formula's class (when the `all_stats` flag is true),
you have access to any other methods or class variables.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
