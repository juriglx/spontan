require 'spontan/is_spontan'
require 'spontan/rule'
require 'spontan/effect'

module Spontan
  
  def self.effect(name, *args, &block)
    options = args.extract_options!
    klass_name = options[:with]
    raise 'Unknown class for effect' if klass_name.blank?

    klass = klass_name.constantize
    raise "#{klass_name} is not spontan" unless klass.respond_to? :effects

    effect = Effect.new 
    effect.name = name
    effect.block = block

    klass.effects[effect.name] = effect
  end

  def self.rule(*args, &block)
    options = args.extract_options!
    klass_name = options[:with]
    raise 'Unknown class for effect' if klass_name.blank?

    klass = klass_name.constantize
    raise "#{klass_name} is not spontan" unless klass.respond_to? :rules

    rule = Rule.new
    rule.effects = options[:fires]
    rule.block = block

    klass.rules << rule
  end

end
