require_relative 'piece'

class King < Piece 
  attr_reader :unicode, :val

  def initialize
    @unicode = "\u2654"
    @val = :K 
  end
end