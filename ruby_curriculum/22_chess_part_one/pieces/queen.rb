require_relative 'piece'

class Queen < Piece 
  attr_reader :sym

  def initialize
   @unicode = "\u2655" 
  end
end