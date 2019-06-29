require_relative 'piece'
require 'colorize'

class Queen < Piece 
  attr_accessor :val, :color

  def initialize(color, val)
    super(color, val) 
    to_symbol 
  end
end