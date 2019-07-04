require_relative 'piece'
require 'colorize'

class Knight < Piece 
  include Stepable 
  attr_accessor :val, :color
  
  def initialize(color, val)
    super(color, val)
  end
  
end