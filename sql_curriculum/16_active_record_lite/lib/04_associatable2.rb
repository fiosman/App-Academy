require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    define_method(name) do 
      through_options = self.class.assoc_options[through_name] 
      source_options = through_options.model_class.assoc_options[source_name]

      through_foreign_val = send(through_options.foreign_key)
      through_primary_key = through_options.primary_key 
      through_table = through_options.table_name 

      source_foreign_key = source_options.foreign_key 
      source_primary_key = source_options.primary_key 
      source_table = source_options.table_name 

      res = DBConnection.execute(<<-SQL, through_foreign_val)
        SELECT 
          #{source_table}.*
        FROM 
          #{through_table}
        JOIN 
          #{source_table}
        ON 
          #{through_table}.#{source_foreign_key} = #{source_table}.#{source_primary_key}
        WHERE 
          #{through_table}.#{through_primary_key} = ?
      SQL 

      source_options.model_class.parse_all(res).first
  end
end
