require_relative 'piece'

class Knight < Piece 
  attr_reader :val

  def initialize
    @val = "\u2658"
  end
end