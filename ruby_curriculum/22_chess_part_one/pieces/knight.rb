require_relative 'piece'

class Knight < Piece 
  attr_reader :unicode, :val

  def initialize
    @unicode = "\u2658"
    @val = :N
  end
end