require_relative 'board'

class Player
  
  def initialize
     @board = Board.new
     @first_guess = nil  
     @second_guess = nil
  end
  
  def current_guess
    puts "Please pick your second card!"
    puts "Acceptable input is a number between 0 & #{@board.deck.length - 1}"
    gets.chomp.to_i
  end

  def previous_guess
    puts "Please pick your first card!"
    puts "Acceptable input is a number between 0 & #{@board.deck.length - 1}"
    gets.chomp.to_i 
  end

  def compare_guesses
    if @board.deck[@first_guess].revealed_value == @board.deck[@second_guess].revealed_value
      puts 'Nice guess!' 
      @board.delete_pairs
    else
      puts 'Please try again'
      @board.reset
    end
    sleep(2)
    @board.clear
  end

  def guess
    @board.clear
    @first_guess = self.previous_guess
    @board.deck[@first_guess].reveal
    @board.clear
    @second_guess = self.current_guess
    @board.deck[@second_guess].reveal
    @board.clear
  end

  def win
    @board.deck.length < 2
  end

end