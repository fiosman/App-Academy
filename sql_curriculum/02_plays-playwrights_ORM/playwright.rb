require_relative 'plays'
require 'sqlite3'

class Playwright

  def self.all 
    data = PlayDBConnection.instance.execute("SELECT * FROM Playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)

  end

  def initialize
  end

  def create
  end

  def update
  end

  def get_plays
  end

end