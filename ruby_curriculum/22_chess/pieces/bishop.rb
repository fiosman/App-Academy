require_relative 'piece'

class Bishop < Piece 
  attr_reader :val
  
  def initialize
    @val = " B ".magenta.bold
  end
end