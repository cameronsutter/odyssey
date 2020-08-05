module Odyssey
  module Refinements
    refine String do
      def readability **args
        Odyssey.analyze(self, **args)
      end
    end
  end
end
