require_relative 'piece'

class Queen < Piece 
  attr_reader :val

  def initialize
   @val = "\u2655"
  end
end