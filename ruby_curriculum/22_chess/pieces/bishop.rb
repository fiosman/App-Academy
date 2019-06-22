require_relative 'piece'

class Bishop < Piece 
  attr_reader :val
  
  def initialize
    @val = "\u2657"
  end
end