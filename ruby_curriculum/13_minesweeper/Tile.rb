class Tile

  attr_accessor :bomb_state, :ui_val, :revealed, :flag_state, :neighbors

  def initialize
    @bomb_state = nil
    @revealed = false
    @ui_val = nil
    @neighbors = Array.new
  end

  def ui_status 
    if self.bomb_state == true && self.revealed == true
      @ui_val = :B
    else
      @ui_val = adjacent_bombs_count
    end
  end

  def bomb_status 
    rand(1..4) == 1 ? @bomb_state = true : @bomb_state = false
  end

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

new_tile = Tile.new 
p new_tile.adjacent_bombs_count