require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    class_name.constantize.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
  
    defaults = { 
      foreign_key: "#{name}_id".to_sym,
      class_name: name.to_s.camelcase,
      primary_key: :id
    }
  
    defaults.keys.each do |attr| 
      self.send("#{attr}=", options[attr] || defaults[attr])
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = { 
      foreign_key: "#{self_class_name.underscore}_id".to_sym,
      primary_key: :id, 
      class_name: name.to_s.singularize.camelcase
    }

    defaults.keys.each do |attr| 
      self.send("#{attr}=", options[attr] || defaults[attr])
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    self.assoc_options[name] = BelongsToOptions.new(name, options) 
    
    define_method(name) do 
      options = self.class.assoc_options[name]

      key_value = send(options.foreign_key)
      
      options
        .model_class 
        .where(options.primary_key => key_value)
        .first
    end
  end

  def has_many(name, options = {})
    self.assoc_options[name] = HasManyOptions.new(name, self.name, options)
    
    define_method(name) do
      options = self.class.assoc_options[name]

      key_val = self.send(options.primary_key)

      options
        .model_class
        .where(options.foreign_key => key_val)
    end
  end

  def assoc_options
    @assoc_options ||= {}
  end
end

class SQLObject
  extend Associatable
end
