require_relative 'tile'
require 'colorize'

class Board

  TILE_VALUES = Array.new
  FILE = "./puzzles/sudoku1.txt"

  attr_reader :grid, :block_hsh

  def self.populate_values(file)
    read_values = File.read(file).split("\n")

    read_values.each do |value| 
      value.split("").map { |int_value| TILE_VALUES << Tile.new(int_value) }
    end
    
    TILE_VALUES.each_slice(9).to_a.each do |row| 
      row.each_index { |idx| row[idx].given? }
    end
  end

  def initialize
    @grid = Board.populate_values(FILE)
    @block_hsh = block_range
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
      print @grid[row][column].render_value
    end
    puts "|"
  end
  puts border
  end

  def [](position)
    @grid[position]
  end

  def block_range
    #https://stackoverflow.com/questions/39567/what-is-the-best-way-to-convert-an-array-to-a-hash-in-ruby
    (0..8).map do |idx| 
      [idx, (idx-idx%3..idx-idx%3+2)]
    end.to_h
  end

end

