class Tile

  attr_accessor :bomb_state, :ui_val, :revealed, :flag_state, :neighbors

  def initialize
    @bomb_state = nil
    @revealed = false
    @ui_val = nil
    @flag_state = nil
    @neighbors = Array.new
  end

  def ui_status 
    if self.bomb_state == true && self.revealed == true
      @ui_val = :B
    elsif self.bomb_state == true && self.flag_state == true 
      @ui_val = :F
    else
      @ui_val = :" " #display count of adjacent neighbours
    end
  end

  def bomb_status 
    rand(1..5) == 1 ? @bomb_state = true : @bomb_state = false
  end

end