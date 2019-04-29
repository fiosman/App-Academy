require 'colorize'

class Tile

  attr_accessor :bomb_state, :ui_val, :revealed, :neighbors

  def initialize
    @bomb_state = nil
    @revealed = false
    @ui_val = "*".colorize(:blue)
    @neighbors = Array.new
  end

  #Handle UI values for each game condition
  def ui_status 
    if self.bomb_state == true && self.revealed == true
      @ui_val = "B".colorize(:red)
    elsif self.revealed == false 
      @ui_val.colorize(:green)
    else
      @ui_val = adjacent_bombs_count.to_s.colorize(:magenta)
    end
  end

  #Randomize bomb cells in the grid (25-30%)
  def bomb_status 
    rand(1..4) == 1 ? @bomb_state = true : @bomb_state = false
  end

  #Generate the number of adjacent bombs
  def adjacent_bombs_count 
    @neighbors.inject(0) do |count, tile| 
      if tile.bomb_state == true 
        count += 1
      else
        count 
      end
    end
  end

end

#per GeeksforGeeks: 
#If there are no adjacent mines to this cell, then we recursively click/step on all the safe adjacent cells (hence reducing the time of the game-play). 
#And if there is atleast a single adjacent mine to this cell then that count is displayed on the current cell. 
#This is given as a hint to the player so that he can avoid stepping/clicking on the cells having mines by logic.
#Also if you click on a cell having no adjacent mines (in any of the surrounding eight cells) then all the adjacent cells are automatically cleared, thus saving our time.