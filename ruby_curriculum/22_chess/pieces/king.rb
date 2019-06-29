require_relative 'piece'
require 'colorize'

class King < Piece 
  attr_accessor :val, :color

  def initialize(val, color)
    super(color, val) 
    to_symbol 
  end
end