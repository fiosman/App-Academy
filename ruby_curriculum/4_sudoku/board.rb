require_relative 'tile'
require 'colorize'

class Board

  TILE_VALUES = Array.new

  attr_reader :grid

  def self.populate_values 
    read_values = File.read("./puzzles/sudoku1.txt").split("\n")

    read_values.each do |value| 
      value.split("").map { |int_value| TILE_VALUES << Tile.new(int_value).render_value.red }
    end
    
    TILE_VALUES.each_slice(9).to_a

  end

  def initialize
    @grid = Board.populate_values
  end

  def render_grid
    border = "  +-----+-----+-----+"
    print "   "
    (0..8).each do |column|
      print "#{column}" + " "
    end

    puts "\n"

    (0..8).each do |row| 
      puts border if row%3 == 0
      print "#{row}" + " "

    (0..8).each do |column|
      print column%3 == 0 ? "|" : " "
      print @grid[row][column] == "0" ? " " : @grid[row][column]
    end
    puts "|"
  end
  puts border
  end
end

 board_1 = Board.new
 board_1.render_grid

