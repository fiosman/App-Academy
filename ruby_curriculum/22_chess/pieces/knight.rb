require_relative 'piece'

class Knight < Piece 
  attr_reader :val

  def initialize
    @val = " N ".blue.bold
  end
end