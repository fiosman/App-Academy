require_relative 'piece'
require 'colorize'
require 'singleton'

class NullPiece < Piece
  include Singleton
  attr_reader :val, :color
  
  def initialize
    @color = nil
    @val = "   "
  end

end

