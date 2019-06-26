require_relative 'piece'
require 'colorize'

class Bishop < Piece 
  attr_reader :val
  
  def initialize
    @val = " B ".magenta.bold
  end
end