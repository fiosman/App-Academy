require_relative 'piece'

class Knight < Piece 
  attr_reader :sym

  def initialize
    @unicode = "\u2658" 
  end
end