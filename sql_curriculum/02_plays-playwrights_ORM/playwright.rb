require_relative 'plays'
require 'sqlite3'

class Playwright

  def self.all 
    data = PlayDBConnection.instance.execute("SELECT * FROM Playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    playwright = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT 
        *
      FROM 
        playwrights
      WHERE 
        playwrights.name = ? 
    SQL
    return nil unless playwright.length > 0 

    playwright = Playwright.new(playwright.first)
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already exists in the database" if @id 
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year) 
      INSERT INTO 
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL

    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    PlayDBConnection.instance.execute(<<-SQL, self.id, self.name, self.birth_year)
      UPDATE 
        playwrights 
      SET 
        name = ?, birth_year = ?
      WHERE 
        id = ? 
    SQL 
  end

  def get_plays
  end

end