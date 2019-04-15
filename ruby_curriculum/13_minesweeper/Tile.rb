class Tile

  attr_accessor :bomb_state, :ui_val, :revealed

  def initialize
    @bomb_state = nil
    @revealed = true
    @ui_val = nil
  end

  def ui_status 
    if self.bomb_state == true && self.revealed == true
      @ui_val = :*
    else
      @ui_val = :" "
    end
  end

  def bomb_status 
    rand(1..2) == 1 ? @bomb_state = true : @bomb_state = false
  end

end