class Tile

  attr_accessor :bomb_state, :ui_val, :revealed, :neighbors

  def initialize
    @bomb_state = nil
    @revealed = false
    @ui_val = :*
    @neighbors = Array.new
  end

  #Handle UI values for each game condition
  def ui_status 
    if self.bomb_state == true && self.revealed == true
      @ui_val = :B
    elsif self.revealed == false 
      @ui_val
    else
      @ui_val = adjacent_bombs_count
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
