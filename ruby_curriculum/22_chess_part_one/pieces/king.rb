require_relative 'piece'

class King < Piece 
  attr_reader :sym

  def initialize
    @unicode = "\u2654" 
  end
end