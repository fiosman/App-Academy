require_relative 'piece'
require 'colorize'

class Pawn < Piece 
  attr_reader :val

  def initialize
    @val = " P ".red.bold
  end
end