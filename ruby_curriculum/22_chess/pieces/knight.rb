require_relative 'piece'
require 'colorize'

class Knight < Piece 
  attr_accessor :val, :color

  def initialize(color, val)
    super(color, val)
  end
  
end