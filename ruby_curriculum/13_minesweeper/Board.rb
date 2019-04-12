require_relative "Tile.rb"

class Board
  
  attr_accessor :grid

  def initialize(grid_size)
    @grid = Array.new(grid_size) { Array.new(grid_size) { Tile.new }} 
  end

  def render(column_size, row_size)
    print "   "
    (0...column_size).each do |column| 
      print "#{column}" + "  "
    end
    
    print "\n"
    
    (0...row_size).each do |row|
      print "#{row}" 

      (0...column_size).each do |column|
        print "  #{column}"
      end

      print "\n"
    end
  end

end

board_1 = Board.new(8)
board_1.render(8,8)

#to-do -> Print out actual grid (i.e. 9x9, each square is a tile and is a bomb or not). 
# | | | | | | | | |
#------------------ 
# | | | | | | | | |
#------------------ 
# | | | | | | | | |
#------------------ 
# | | | | | | | | |
#------------------ 
# | | | | | | | | |
#------------------ 
# | | | | | | | | |
#------------------ 
# | | | | | | | | |
#------------------ 
# | | | | | | | | | 
#------------------
# | | | | | | | | | 