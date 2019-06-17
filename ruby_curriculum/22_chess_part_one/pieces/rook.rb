require_relative 'piece'

class Rook < Piece 
  attr_reader :sym

  def initialize
    @unicode = "\u2656" 
  end
end
