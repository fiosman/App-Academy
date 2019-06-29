require_relative 'piece'
require 'colorize'

class Pawn < Piece 
  attr_accessor :val, :color

  def initialize(color, val)
    super(color, val)
    to_symbol 
  end
end