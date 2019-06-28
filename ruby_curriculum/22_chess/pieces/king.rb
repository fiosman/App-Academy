require_relative 'piece'
require 'colorize'

class King < Piece 
  attr_reader :val

  def initialize
    @val = " K "
  end
end