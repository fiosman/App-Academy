require_relative 'piece'

class Bishop < Piece 
  attr_reader :unicode, :val
  
  def initialize
    @unicode = "\u2657"
    @val = :B 
    #white only
  end
end