require_relative 'piece'
require 'colorize'

class Queen < Piece 
  attr_reader :val

  def initialize
   @val = " Q "
  end
end