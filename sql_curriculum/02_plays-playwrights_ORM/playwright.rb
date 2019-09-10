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

  end

  def update
  end

  def get_plays
  end

end