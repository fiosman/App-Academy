require_relative 'piece'

class Queen < Piece 
  attr_reader :val

  def initialize
   @val = " Q ".green.bold
  end
end