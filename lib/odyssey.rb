require "odyssey/version"

module Odyssey
  FORMULAS = %w[Ari ColemanLiau FleschKincaidGl FleschKincaidRe GunningFog Smog]
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

  def self.analyze_multi(text, formula_names, all_stats = false)
    raise ArgumentError, "You must supply at least one formula" if formula_names.empty?

    scores = {}
    @engine = Odyssey::Engine.new(formula_names[0])
    scores[formula_names[0]] = @engine.score(text)

    formula_names.drop(1).each do |formula_name|
      @engine.update_formula(formula_name)
      scores[formula_name] = @engine.score("", false)
    end

    if all_stats
      all_stats = @engine.get_stats(false)
      all_stats['scores'] = scores
      output = all_stats
    else
      output = scores
    end

    output
  end

  def self.analyze_all(text)
    analyze_multi text, FORMULAS, true
  end

  #run whatever method was given as if it were a shortcut to a formula
  def self.method_missing(method_name, *args, &block)
    #send to the main method
    formula_class = method_name.to_s.split("_").map(&:capitalize).join
    super unless Object.const_defined? formula_class
    analyze(args[0], formula_class, args[1] || false)
  end
end

require 'odyssey/engine'
require 'odyssey/refinements'
require 'odyssey/formulas/formula'

require 'odyssey/formulas/ari'
require 'odyssey/formulas/coleman_liau'
require 'odyssey/formulas/fake_formula'
require 'odyssey/formulas/flesch_kincaid_gl'
require 'odyssey/formulas/flesch_kincaid_re'
require 'odyssey/formulas/gunning_fog'
require 'odyssey/formulas/smog'
