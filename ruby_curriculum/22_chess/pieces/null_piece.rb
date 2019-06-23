require_relative 'piece'

class NullPiece < Piece
  attr_reader :val
  
  def initialize
    @val = "   " 
  end

end