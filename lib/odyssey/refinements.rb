module Odyssey
  module Refinements
    refine String do
      def readability
        Odyssey.analyze_all self
      end
    end
  end
end