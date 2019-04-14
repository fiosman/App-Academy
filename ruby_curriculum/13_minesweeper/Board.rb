require_relative "Tile.rb"

class Board
  
  attr_accessor :grid

  def initialize(grid_size)
    @grid = Array.new(grid_size) { Array.new(grid_size) { Tile.new(rand(0..1)) }} 
  end

  def render(column_size, row_size)
    print "   "
    (0...column_size).each do  |column| 
      print "#{column}" + "  "
    end
    
    print "\n"
    
    (0...row_size).each do |row|
      print "\n"
      print "#{row}" 

      (0...column_size).each do |column|
        print "  #{self.grid[row][column].value}"
      end
      print "\n"

    end
  end

  def populate_board 
    @grid.each_index do |idx1| 
      (@grid[idx1]).each do |tile| 
        tile.status?
      end
    end
    @grid
  end

end

