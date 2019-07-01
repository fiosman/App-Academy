require 'colorize'

class Piece
  attr_accessor :val, :color

  def initialize(color, val)
    @val = val
    @color = color
  end

  def to_symbol
    if @color == :black 
      @val.black
    else
      @val.white
    end
  end 

end


