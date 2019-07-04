require_relative 'piece'
require 'colorize'

class Queen < Piece 
  include Slideable 
  attr_accessor :val, :color
  
  def initialize(color, val)
    super(color, val) 
  end

end


