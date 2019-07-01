require 'colorize'
require_relative 'board'
require_relative 'pieces'

class Display
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render 
    @board.rows.each_with_index do |row, row_idx|
      print "#{row_idx} "
      row.each_with_index do |square, square_idx| 
        #print square
        print generate_pattern_color(row_idx, square_idx, square.val)
      end
      puts "\n"
    end
    print "   a  b  c  d  e  f  g  h "
  end

  def generate_pattern_color(row_idx, square_idx, value)
    if row_idx.even? 
      square_idx.even? ? value.colorize(:background => :red) : value.colorize(:background => :cyan)
    else
      square_idx.odd? ? value.colorize(:background => :red) : value.colorize(:background => :cyan)
    end
  end

end

display_1 = Display.new(Board.new)
display_1.render


