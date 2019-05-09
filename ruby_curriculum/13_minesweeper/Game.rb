require_relative 'Board.rb'

class Game
  attr_accessor :board 

  def initialize(grid_size)
    @board = Board.new(grid_size)
  end

  #keep playing the game until player picks a bomb
  def run
    unless game_won?
      play until game_over?
      p "Oops, you've lost the game!"
    end
    return
  end

  #Game is over if user selects a bomb
  def game_over?  
    @board.grid.each do |set| 
      return set.any? { |tile| tile.revealed == true && tile.bomb_state == true }
    end
  end

  #Game is won when number of unrevealed cells is equal to number of mines on board
  def game_won? 
    if @board.count_mines == @board.count_unrevealed_cells
      p "Congrats, you've won!"
    end
  end

  #Main method is user I/O
  def play 
    @board.render
    fetch_value
  end

  #Parse user position and reveal its value, handle exceptions
  def fetch_value 
    begin 
      row, col = parse_pos 
      if row.between?(0, @board.grid.size-1) && 
         col.between?(0, @board.grid.size-1) && 
         !@board.grid[row][col].revealed 
           @board.reveal_values(row,col)
      end
    rescue
      fetch_value
    end
  end

  #Prompt for user input, convert to array of integers such that indexing is possible
  def parse_pos 
    p "Please enter a valid position (e.g. 3,4)"
    response = gets.chomp

    response.split(",").map { |pos| Integer(pos) }
  end

end

game_1 = Game.new(9)
game_1.run


