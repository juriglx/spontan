module Spontan
  class Effect
    attr_accessor :name, :block

    def realize(target)
      block.call(target)
    end
  end
end