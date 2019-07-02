require_relative 'piece'
require 'colorize'

class NullPiece < Piece
  attr_accessor :val, :color
  
  def initialize(color, val)
    super(color, val)
  end

end

