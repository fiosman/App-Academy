require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    return @columns unless @columns.nil? 

    @columns = DBConnection.execute2(<<-SQL) 
      SELECT 
        * 
      FROM 
        #{self.table_name}
      LIMIT 
        1
    SQL

    @columns.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column| 
      define_method("#{column}") do 
        attributes[column] ||= nil
      end

      define_method("#{column}=") do |value| 
        attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    if @table_name.nil? 
      self.to_s.tableize 
    else
      @table_name
    end
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= {}
  end 

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
