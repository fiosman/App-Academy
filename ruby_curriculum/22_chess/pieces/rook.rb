require_relative 'piece'
require 'colorize'

class Rook < Piece 
  attr_reader :val

  def initialize
    @val = " R ".cyan.bold
  end
end
