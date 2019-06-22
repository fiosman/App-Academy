require_relative 'piece'

class Rook < Piece 
  attr_reader :val

  def initialize
    @val = "\u2656" 
  end
end
