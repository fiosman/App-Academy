require_relative 'piece'

class Pawn < Piece 
  attr_reader :unicode, :val

  def initialize
    @unicode = "\u2659" 
    @val = :P
  end
end