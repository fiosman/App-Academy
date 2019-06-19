require_relative 'piece'

class Rook < Piece 
  attr_reader :unicode, :val

  def initialize
    @unicode = "\u2656" 
    @val = :R
  end
end
