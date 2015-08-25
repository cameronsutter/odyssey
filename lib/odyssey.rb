require "odyssey/version"

module Odyssey

  DEFAULT_FORMULA = 'FleschKincaidRe'

  #main method
  def self.analyze(text, formula_name = DEFAULT_FORMULA, all_stats = false)
    formula_name ||= DEFAULT_FORMULA
    
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
  def self.method_missing(method_name, *args, &block)
    #send to the main method
    formula_class = method_name.to_s.split("_").map(&:capitalize).join
    super unless Object.const_defined? formula_class
    analyze(args[0], formula_class, args[1] || false)
  end

  #define this here, so it doesn't get sent to method_missing()
  def self.to_ary
    []
  end
end

require 'require_all'
require 'odyssey/engine'
require_rel 'formulas'
