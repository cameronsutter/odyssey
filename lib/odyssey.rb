require "odyssey/version"

module Odyssey

  DEFAULT_FORMULA = 'Flesch_kincaid_RE'

  #main method
  def self.analyze(text, formula_name = DEFAULT_FORMULA, all_stats = false)
    #catch nils
    formula_name = DEFAULT_FORMULA if formula_name == nil
    
    @engine = Odyssey::Engine.new(formula_name)
    score = @engine.score(text)
    
    #return all stats?
    if all_stats
      output = @engine.get_stats
    else
      output = score
    end

    output
  end

  #run whatever method was given as if it were a shortcut to a formula
  def self.method_missing(*args)
    method_string = args[0].to_s

    #capitalize the first letter
    first_letter = method_string[0].upcase
    method_string[0] = first_letter

    #send to the main method
    analyze(args[1], method_string, args[2] || false)
  end

  #define this here, so it doesn't get sent to method_missing()
  def self.to_ary
    []
  end

  #######################################################
  # pre-built methods that act as shortcuts to formulas #
  #######################################################
  
  def self.flesch_kincaid_reading_ease(text, all_stats = false)
    analyze(text, 'Flesch_kincaid_RE', all_stats)
  end

  def self.flesch_kincaid_grade_level(text, all_stats = false)
    analyze(text, 'Flesch_kincaid_GL', all_stats)
  end

  def self.gunning_fog(text, all_stats = false)
    analyze(text, 'Gunning_fog', all_stats)
  end

  def self.coleman_liau(text, all_stats = false)
    analyze(text, 'Coleman_liau', all_stats)
  end

  def self.smog(text, all_stats = false)
    analyze(text, 'Smog', all_stats)
  end

  def self.ari(text, all_stats = false)
    analyze(text, 'Automated_readability', all_stats)
  end

end

require 'require_all'
require 'odyssey/engine'
require_rel 'formulas'