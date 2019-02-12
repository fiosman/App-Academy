####Each tile represents a position on the Sudoku Board####

class Tile 

  attr_reader :value

  def initialize(value)
     @value = value
  end

  def render_value 
    @value == "0" ? " " : @value
  end

end
