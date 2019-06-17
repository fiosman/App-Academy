require_relative 'piece'

class Pawn < Piece 
  attr_reader :sym

  def initialize
    @unicode = "\u2659" 
  end
end