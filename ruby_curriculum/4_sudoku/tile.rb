####Each tile represents a position on the Sudoku Board####

class Tile 

  attr_accessor :value, :given

  def initialize(value)
     @value = value
     @given = nil
  end

  def render_value 
    @value == "0" ? "." : @value
  end

  def given? 
    @value != "0" ? @given = true : @given = false
  end

end
