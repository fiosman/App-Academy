require_relative "Tile.rb"

class Board
  
  attr_accessor :grid

  #Amount of tiles is equal to the grid size (i.e. input of 9 is a 9x9 grid, total of 81 tiles)
  def initialize(grid_size)
    @grid = Array.new(grid_size) { Array.new(grid_size) { Tile.new }} 
    populate_board
  end

  #display the grid of tiles
  def render(column_size=9, row_size=9)
    print "  "
    (0...column_size).each do  |column| 
      print " #{column} " 
    end
    
    print "\n"
    
    (0...row_size).each do |row|
      print "\n"
      print "#{row}" 

      (0...column_size).each do |column|
        print "  #{self.grid[row][column].ui_status}" 
      end
      print "\n"

    end
  end

  #fill up board with tiles, each of which is either bomb or not and has UI symbol
  def populate_board 
    @grid.each_index do |idx1| 
      (@grid[idx1]).each do |tile| 
        tile.bomb_status
        tile.ui_status
      end
    end
    @grid
  end

end

