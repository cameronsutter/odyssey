require "odyssey/version"

module Odyssey

  #main function
  def self.analyze(text, formula_name = 'Flesch_kincaid_RE', all_stats = false)
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

  def self.version_string
    "#{Odyssey::VERSION}"
  end

  #############################################
  # pre-built functions that act as shortcuts #
  #############################################
  
  def self.flesch_kincaid_reading_ease(text, all_stats = false)
    self.analyze(text, 'Flesch_kincaid_RE', all_stats)
  end

  def self.flesch_kincaid_grade_level(text, all_stats = false)
    self.analyze(text, 'Flesch_kincaid_GL', all_stats)
  end
  
end

require 'require_all'
require 'odyssey/engine'
require_rel 'formulas'