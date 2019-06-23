require_relative 'piece'

class Pawn < Piece 
  attr_reader :val

  def initialize
    @val = " P ".red.bold
  end
end