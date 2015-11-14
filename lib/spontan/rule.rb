module Spontan
  class Rule
    attr_accessor :block, :effects

    def initialize
      @effects = []
    end
    
    def applies?(target)
      block.call(target)
    end

  end
end