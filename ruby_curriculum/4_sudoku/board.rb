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
    print "  "
    (0..8).each do |column| 
      print "#{column}" + " "
    end
    puts "\n"
    @grid.each_with_index do |row, row_idx| 
      puts "#{row_idx} #{row.join(" ")}"
    end
  end

end

 board_1 = Board.new
 board_1.render_grid





