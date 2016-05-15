module Spontan
  module IsSpontan
    extend ActiveSupport::Concern

    included do 
    end
    
    module ClassMethods
      def is_spontan
        mattr_accessor :effects, :rules
        self.effects = {}
        self.rules = []

        begin
          effects_file = "effects/#{name.underscore}.effects"
          load effects_file
          include Spontan::IsSpontan::LocalInstanceMethods
        rescue LoadError
          logger.warn "Could not find effects file. Expected it to be at #{effects_file}"
        end
        
      end
    end

    module LocalInstanceMethods
      def spontan_effects
        realized_effects = []
        
        rules.each do |rule|
          if rule.applies?(self)
            rule.effects.each do |effect_name|
              effect = effects[effect_name]
              if effect
                realized_effects << effect_name
                effects[effect_name].realize(self)
              end
            end
          end
        end

        realized_effects
      end
    end

  end
end

ActiveRecord::Base.send :include, Spontan::IsSpontan