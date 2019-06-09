require_relative 'piece'

class NullPiece < Piece
  def initialize
    @val = :*
  end
end