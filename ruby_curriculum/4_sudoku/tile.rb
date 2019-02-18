####Each tile represents a position on the Sudoku Board####
require 'colorize'

class Tile 

  attr_accessor :value, :given

  def initialize(value)
     @value = value
     @given = nil
  end

  def render_value 
    if @value == "0" 
      print "."
    elsif @value != "0" && @given == false
      print @value.green
    else
      print @value.red
    end
  end

  def given? 
    @value != "0" ? @given = true : @given = false
  end

end
