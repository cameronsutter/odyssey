require "odyssey/error"

module Odyssey
  FORMULAS = %i[Ari ColemanLiau FleschKincaidGl FleschKincaidRe GunningFog Smog].freeze
  DEFAULT_FORMULA = FORMULAS[3]

  # def self.analyze text, formula_name = DEFAULT_FORMULA, all_stats = false
  #   formula_name ||= DEFAULT_FORMULA

  #   @engine = Odyssey::Engine.new(formula_name)
  #   score = @engine.score(text)

  #   return @engine.get_stats if all_stats

  #   score
  # end
end

require "odyssey/engine"
require "odyssey/refinements"
require "odyssey/formulas/formula"

require "odyssey/formulas/ari"
require "odyssey/formulas/coleman_liau"
require "odyssey/formulas/fake_formula"
require "odyssey/formulas/flesch_kincaid_gl"
require "odyssey/formulas/flesch_kincaid_re"
require "odyssey/formulas/gunning_fog"
require "odyssey/formulas/smog"
