require_relative "Tile.rb"

class Board
  
  attr_accessor :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) { Tile.new }} 
  end

  def render 
    

  end

end

#to-do -> Print out actual grid (i.e. 9x9, each square is a tile and is a bomb or not). 