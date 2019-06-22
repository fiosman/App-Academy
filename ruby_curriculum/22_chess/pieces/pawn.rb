require_relative 'piece'

class Pawn < Piece 
  attr_reader :val

  def initialize
    @val = "\u2659"
  end
end