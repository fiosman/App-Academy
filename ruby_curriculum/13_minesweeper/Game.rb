require_relative 'Board.rb'
require_relative 'Player.rb'

class Game
  attr_accessor :player, :board 

  def initialize(grid_size)
    @player = Player.new
    @board = Board.new(grid_size)
  end

  def run
    play until game_over?
  end

  def game_over? 

  end

  def play 
    p @board.grid
    @board.render
    fetch_value
    system('clear')
  end

  def fetch_value 
    pos = @player.parse_pos 
    row = pos[0]
    col = pos[1]

    #if you hit a bomb... reveal all tiles, game over
    if @board.grid[row][col].bomb_state == true
       display_all
       @board.render
    #otherwise, reveal that one value 
    else
      @board.grid[row][col].revealed = true 
      @board.render
    end
  end

  def display_all 
    @board.grid.each do |set| 
      set.each { |tile| tile.revealed = true }
    end
  end 

end

game_1 = Game.new(9)
game_1.run



#To-do - Figure out how many adjacent cells to a specific cell are bombs 