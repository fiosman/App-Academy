require_relative 'piece'

class Queen < Piece 
  attr_reader :unicode, :val

  def initialize
   @unicode = "\u2655"
   @val = :Q
  end
end