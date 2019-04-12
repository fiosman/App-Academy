require_relative "Tile.rb"

class Board
  
  attr_accessor :grid

  def initialize(grid_size)
    @grid = Array.new(grid_size) { Array.new(grid_size) { Tile.new(rand(0..9)) }} 
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

end

# board_1 = Board.new(9)
# board_1.render(9,9)
