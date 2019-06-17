require_relative 'piece'

class Bishop < Piece 
  attr_reader :sym
  
  def initialize
    @unicode = "\u2657" #white only
  end
end