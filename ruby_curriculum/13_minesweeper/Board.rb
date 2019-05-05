require_relative "Tile.rb"
#require_relative "Player.rb"

class Board
  
  attr_accessor :grid

  #Amount of tiles is equal to the grid size (i.e. input of 9 is a 9x9 grid, total of 81 tiles)
  def initialize(grid_size=9)
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

  #populate all bombs adjacent to a selected tile
  def get_neighbors(row_pos, col_pos)
    directions = [
      [-1, -1], [0, -1], [1, -1], [-1, 0], 
      [1, 0], [-1, 1], [0, 1], [1,1]]
      
      directions.each do |direction| 
        neighbor_row = row_pos + direction.first
        neighbor_col = col_pos + direction.last
        #position = [neighbor_row, neighbor_col]
        if neighbor_row.between?(0, @grid.size-1) && neighbor_col.between?(0, @grid.size-1)
          #p [neighbor_row, neighbor_col]
          @grid[row_pos][col_pos].neighbors << @grid[neighbor_row][neighbor_col]
          @grid[neighbor_row][neighbor_col].position = [neighbor_row, neighbor_col]
        end
      end
      if @grid[row_pos][col_pos].adjacent_bombs_count == 0 
        @grid[row_pos][col_pos].neighbors.each do |neighbor| 
          #get the neighbors 
          get_neighbors(neighbor.position.first, neighbor.position.last)
          #{ |neighbor| p neighbor.adjacent_bombs_count }
        end
      end
    end

  #Reveal value of input tile 
  def reveal_values(row_pos, col_pos)
    if @grid[row_pos][col_pos].bomb_state == true 
      self.display_all
      self.render
      #game_over
    else
      @grid[row_pos][col_pos].revealed = true  
      #self.render
      self.get_neighbors(row_pos, col_pos)
      #if @grid[row_pos][col_pos].adjacent_bombs_count == 0
        #print out the number of adjacent bombs in each of the adjacent neighbors cells
      #p @grid[row_pos][col_pos].neighbors
      #@grid[row_pos][col_pos].neighbors.each { |neighbor| neighbor.get_neighbors(1,2) }
      #@grid[row_pos][col_pos].neighbors.each { |neighbor| neighbor.get_neighbors(@position.first, @position.last) }
      #end
      #Get the neighbors, count the number of neighbors
    end

    def reveal_val(row_pos, col_pos)
      @grid[row_pos][col_pos].revealed = true
    end

    # def get_other_neighbors(neighbors) 
    #   neighbors.each do |neighbor|

    #   end
    # end

    #  if @grid[row_pos][col_pos].adjacent_bombs_count == 0 
    #  # @grid[row_pos][col_pos].
    #    #@grid[row_pos][col_pos].neighbors.each { |neighbor| neighbor.reveal_values(neighbor.first, neighbor.last) unless neighbor.revealed }
    #    p @grid[row_pos][col_pos].neighbors
    #    @grid[row_pos][col_pos].neighbors.each { |neighbor| p neighbor.neighbors }
    #  end
  end

  #Different houses -> [1,2,3,4,5,6,7]
  #Power off 
  

  #Explore if a tile has been revealed already
  def any_revealed? 
    @grid.each do |set| 
      return set.any? { |tile| tile.revealed == true }
    end
  end

  #def [](position)
    #row = position[0]
    #col = position[1] 
    #@grid[row][col] 
  #end

  #display values of all tiles
  def display_all
    @grid.each { |set| set.each { |tile| tile.revealed = true }} 
  end 

  #Return number of mines on the board
  def count_mines 
    @grid.flatten.select { |tile| tile.bomb_state == true }.count
  end

  #Count the number of unrevealed tiles on the board
  def count_unrevealed_cells 
    @grid.flatten.select { |tile| tile.revealed == false }.count
  end

end

#If there is a count of 0 adjacent neighbors, then we want to 
#explore all the adjacent neighbors of the neighbors in the original call that produced 0 
#The issue however is 

