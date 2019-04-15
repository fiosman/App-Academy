require_relative 'Board.rb'
require_relative 'Player.rb'

class Game
  attr_accessor :player, :board 

  def initialize(grid_size)
    @player = Player.new
    @board = Board.new(grid_size)
  end

  def run
    @board.render
    play until game_over?
  end

  def game_over? 

  end

  def play 
    p @board.grid
    @board.render
    fetch_value
  end

  def fetch_value 
    pos = @player.parse_pos 
    row = pos[0]
    col = pos[1]

    @board.grid[row][col].revealed = true
    @board.render
    p @board.grid[row][col]
  end

end

game_1 = Game.new(9)
game_1.play