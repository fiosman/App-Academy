require_relative 'piece'

class King < Piece 
  attr_reader :val

  def initialize
    @val = "\u2654"
  end
end