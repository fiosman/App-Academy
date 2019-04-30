require_relative 'Board.rb'

class Game
  attr_accessor :board 

  def initialize(grid_size)
    @board = Board.new(grid_size)
  end

  #keep playing the game until player picks a bomb
  def run
    play until game_over?
    p 'Oops, you lost!'
  end

  #Game is over if user selects a bomb
  def game_over?  
    @board.grid.each do |set| 
      return set.any? { |tile| tile.ui_val == :B }
    end
  end

  #Game is won if user has revealed all non-bomb cells
  def game_won? 
   count_mines == count_unrevealed_cells 
  end

  #Main method is user I/O
  def play 
    #p @board.grid
    system('clear')
    @board.render
    fetch_value
  end

  #Parse user position and reveal its value
  def fetch_value 
    pos = parse_pos 
    row = pos[0]
    col = pos[1]

    @board.reveal_values(row,col)
  end

  #Prompt for user input, convert to array of integers such that indexing is possible
  def parse_pos 
    p "Please enter a position (e.g. 3,4)"
    response = gets.chomp

    response.split(",").map { |pos| Integer(pos) } 
  end

end

game_1 = Game.new(9)
game_1.run

