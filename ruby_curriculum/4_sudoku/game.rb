require_relative 'board'
require 'colorize'

class Game

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def prompt_pos 
    p "Please enter a valid position (e.g. 2,1)"
    response = gets.chomp
    if !response.include?(",") || response.include?(" ")
      prompt_pos
    else
    response.split(",").map(&:to_i)
    end
  end

  def prompt_val
    p "Please enter a valid number between 1 & 9"
    response = gets.chomp
    return response if response.to_i.between?(1, 9) && response.length == 1 && response.to_i != 0
    prompt_val
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
     @board.render_grid
  end

  def valid_move? 
    system('clear')
    @board.render_grid 

    temp_pos = self.prompt_pos
    row = temp_pos[0]
    column = temp_pos[1]

    temp_val = self.prompt_val

     if  !row_check(row, temp_val) && 
         !column_check(column, temp_val) &&
         !block_check(row, column, temp_val) && 
            @board[row][column].given == false
            @board[row][column].value = temp_val
     end
    valid_move?
    
  end

  def row_check(row, input)
    #check if input value is included in the row where the input value is located
    @board[row].collect { |ele| ele.value }.include?(input)
  end

  def column_check(column, input)
    #check if input value is included in the colum where the input value is located
    @board.grid.map { |row| row[column].value }.include?(input)
  end

  def block_check(row_pos, col_pos, input)
    #check if input value is included in the 3x3 block where the input value is located
    block_vals = []

    (@board.block_hsh[row_pos]).each do |row_idx| 
      (@board.block_hsh[col_pos]).each do |col_idx|
        block_vals << @board.grid[row_idx][col_idx].value 
      end
    end 
    block_vals.include?(input)
  end

   def solved? 
  #   arr_vals = []
  #   @board.grid.each do |row_pos| 
  #    arr_vals.push (row_pos.map { |row| row.given? })
  #   end
  #   arr_vals.flatten.all? { |ele| ele == true }
   end

  def play 
    system('clear')
    valid_move?
  end

end

game_1 = Game.new
game_1.play
#p game_1.valid_move?
#p game_1.board
#game_1.play

