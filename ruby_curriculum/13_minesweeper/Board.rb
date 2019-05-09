require_relative "Tile.rb"
require 'byebug'

class Board
  
  attr_accessor :grid
  CELL_MOVES = [[-1, -1], [0, -1], [1, -1], [-1, 0], 
      [1, 0], [-1, 1], [0, 1], [1,1]]

  #Amount of tiles is equal to the grid size (i.e. input of 9 is a 9x9 grid, total of 81 tiles)
  def initialize(grid_size=9)
    @grid = Array.new(grid_size) { Array.new(grid_size) { Tile.new }} 
    populate_board
  end

  #display the grid of tiles
  def render(column_size=9, row_size=9)
    system('clear')
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
    @grid.each_index do |idx| 
      (@grid[idx]).each do |tile| 
        tile.bomb_status
        tile.ui_status
      end
    end
    @grid
  end

  #populate all bombs adjacent to a selected tile
  def get_neighbors(row_pos, col_pos)
    
    cell_pos = @grid[row_pos][col_pos]
    cell_pos.position = row_pos, col_pos

        CELL_MOVES.each do |cell_move| 
        neighbor_row = row_pos + cell_move.first
        neighbor_col = col_pos + cell_move.last
        if neighbor_row.between?(0, @grid.size-1) && neighbor_col.between?(0, @grid.size-1)
          cell_pos.neighbors << @grid[neighbor_row][neighbor_col]
          @grid[neighbor_row][neighbor_col].position = [neighbor_row, neighbor_col]
        end 
      end
    end

  #Reveal value of input tile 
  def reveal_values(row_pos, col_pos)
    if @grid[row_pos][col_pos].bomb_state == true 
      self.display_all
      self.render
    else
      @grid[row_pos][col_pos].revealed = true 
      self.get_neighbors(row_pos,col_pos)

  #handle case where there are zero bombs adjacent to a player-selected tile
      cell_pos = @grid[row_pos][col_pos]
      if cell_pos.adjacent_bombs_count == 0 
        cell_pos.neighbors.each do |neighbor| 
          get_neighbors(neighbor.position.first, neighbor.position.last)
          neighbor.revealed = true
        end
      end
    end
  end

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
