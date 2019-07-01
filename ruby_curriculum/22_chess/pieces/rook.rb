require_relative 'piece'
require 'colorize'

class Rook < Piece 
  attr_accessor :val, :color

  def initialize(color, val)
    super(color, val)
    to_symbol
  end
end

# rook = Rook.new(:black, 'R')
# #p rook.val
# puts rook.to_symbol
