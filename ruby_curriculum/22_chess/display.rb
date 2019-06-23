require 'colorize'
require_relative 'board'
require_relative './pieces/bishop'

class Display
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render 
    @board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |square, square_idx| 
        if row_idx.even? 
          print even_row(square_idx, square.val)
        else
          print odd_row(square_idx, square.val)
        end
      end
      puts "\n"
    end
  end

  def even_row(square_idx, value)
    square_idx.even? ? value.colorize(:background => :black) : value.colorize(:background => :white)
  end

  def odd_row(square_idx, value)
    square_idx.odd? ? value.colorize(:background => :black) : value.colorize(:background => :white)
  end

end

display_1 = Display.new(Board.new)
# #pp display_1
display_1.render

