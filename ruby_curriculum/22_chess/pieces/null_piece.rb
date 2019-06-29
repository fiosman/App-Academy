require_relative 'piece'

class NullPiece < Piece
  attr_accessor :val
  
  def initialize
    @val = "   " 
  end

end