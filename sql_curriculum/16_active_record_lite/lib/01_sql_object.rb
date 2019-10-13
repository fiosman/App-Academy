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

    @columns = @columns.first.map!(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column_name| 
      define_method(column_name) { attributes[column_name] }
      define_method("#{column_name}=") { |value| attributes[column_name] = value }
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
    res = DBConnection.execute(<<-SQL)
      SELECT 
        * 
      FROM 
        #{self.table_name}
    SQL

    self.parse_all(res)
  end

  def self.parse_all(results)
    results.map { |record| self.new(record) }
  end

  def self.find(id)
   res = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        #{self.table_name}
      WHERE 
        id = ?
    SQL

    self.parse_all(res).first
  end

  def initialize(params = {})
    params.each do |k, v| 
      attr_name = k.to_sym
      if !self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"
      else 
        self.send("#{attr_name}=", v)
      end
    end
  end

  def attributes
    @attributes ||= {}
  end 

  def attribute_values
    self.class.columns.map { |column_name| self.send(column_name) }
  end

  def insert
    columns = self.class.columns[1..-1].join(", ")
    question_marks = (["?"] * self.class.columns[1..-1].length).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values[1..-1]) 
      INSERT INTO   
        #{self.class.table_name} (#{columns})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
