require 'colorize'

class Piece
  attr_accessor :val, :color

  def initialize(color, val)
    @val = val
    @color = color
  end

  def to_symbol
    @val.colorize(@color)
  end

end


