# Odyssey

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

e.g. <code>Odyssey.flesch_kincaid_re("See Spot run.", true)</code>

if all_stats is false, this returns a simple score. If it is true, it returns a Hash:

<code>
{ 
  'name'                       => String,
  'formula'                    => formula_class,
  'score'                      => Float,
  'string_length'              => Fixnum,
  'letter_count'               => Fixnum,
  'syllable_count'             => Fixnum,
  'word_count'                 => Fixnum,
  'sentence_count'             => Fixnum,
  'sentence_count'             => Fixnum,
  'average_words_per_sentence' => Float,
  'average_syllables_per_word' => Float
}
</code>

##Extending Odyssey

To extend Odyssey, you can create a class that inherits from Formula.
<code>
class Cool_new_formula < Formula
  
  def score(text, stats)

  end

  def name
    "Cool new formula"
  end
end

#text will be a Hash like so:
data = {
  'raw' => String,
  'words' => Array,
  'sentences' => Array,
  'syllables' => Array
}

#stats will be a Hash like so:
{
  'string_length' => Fixnum,
  'letter_count' => Fixnum,
  'syllable_count' => Fixnum,
  'word_count' => Fixnum,
  'sentence_count' => Fixnum,
  'average_words_per_sentence' => Float,
  'average_syllables_per_word' => Float
}
</code>
That is all you need.
To call your formula you just use 

<code>Odyssey.cool_new_formula('See Spot run.', true)</code>

Because you have access to the formula's class (when the 'all_stats' flag is true),
you have access to any other methods or class variables.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
