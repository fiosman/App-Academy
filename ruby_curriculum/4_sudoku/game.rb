require_relative 'board'

class Game

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def prompt_pos 
    p "Please enter a position (e.g. 2,1)"
    gets.chomp.split(",").map(&:to_i)
  end

  def prompt_val
    p "Please enter a valid value (e.g. 9)"
    gets.chomp
  end

  def get_pos
    response = self.prompt_pos
    row = response[0]
    column = response[1]
    @board[row][column]
  end

  def set_pos 
    pos = self.prompt_pos
    response = self.prompt_val
    row = pos[0]
    column = pos[1]
    @board[row][column] = response
  end

end
