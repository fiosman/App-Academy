require_relative 'piece'
require 'colorize'

class Bishop < Piece 
  attr_reader :val
  
  def initialize
    @val = " B "
  end
end