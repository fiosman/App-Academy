require_relative 'Board.rb'
require_relative 'Player.rb'

class Game
  attr_accessor :player, :board 

  def initialize(grid_size)
    @player = Player.new
    @board = Board.new(grid_size)
  end

  #keep playing the game until player picks a bomb
  def run
    p @board.grid
    play until game_over?
    p 'Oops, you lost!'
  end

  #Game is over if user selects a bomb
  def game_over?  
    @board.grid.each do |set| 
      return set.any? { |tile| tile.ui_val == :* }
    end
  end

  def play 
    p @board.grid
    @board.render
    fetch_value
    #system('clear')
  end

  def fetch_value 
    pos = @player.parse_pos 
    row = pos[0]
    col = pos[1]

    @player.prompt_flag if any_revealed? 
    #if you hit a bomb... reveal all tiles
    if @board.grid[row][col].bomb_state == true
       display_all
       @board.render
    #otherwise, reveal that one value 
    else
      @board.grid[row][col].revealed = true 
      @board.render
    end
  end

  #display values of all tiles
  def display_all 
    @board.grid.each do |set| 
      set.each { |tile| tile.revealed = true }
    end
  end 

  def any_revealed? 
    @board.grid.each do |set| 
      return set.any? { |tile| tile.revealed == true }
    end
  end

end

game_1 = Game.new(9)
#p game_1.any_revealed?
game_1.run




#To-do - Figure out how many adjacent cells to a specific cell are bombs 