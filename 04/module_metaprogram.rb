module Metaprogram
  def attr_accessor_with_history(*attrs)
    attrs.each do |attribute|
      define_method(attribute) { instance_variable_get("@#{attribute}") }
      define_method("#{attribute}_history") { instance_variable_get("@#{attribute}_history") }
      define_method("#{attribute}=") do |val|
        instance_variable_set("@#{attribute}", val)
        history = instance_variable_get("@#{attribute}_history") || []
        instance_variable_set("@#{attribute}_history", history << val)
      end
    end
  end

  def strong_attr_accessor(attribute, attr_class)
    define_method(attribute) { instance_variable_get("@#{attribute}") }
    define_method("#{attribute}=") do |val|
      raise 'wrong class' if val.class != attr_class
      instance_variable_set("@#{attribute}", val)
    end
  end
end

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(_name, _type, *_params)
      ''
    end
  end

  module InstanceMethods
    def validate!
      raise 'Name can`t be nil' if @name.nil?
      raise 'Name should be at least 3 symbols' if @name.length < 3
      true
    end

    def valid?
      validate!
    rescue StandardError => e
      puts e.message
      false
    end
  end
end