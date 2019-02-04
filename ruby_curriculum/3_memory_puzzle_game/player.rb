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
    response = gets.chomp.to_i
    
    if exceed_deck_size?(response)
      @board.clear
      current_guess
    else
      @second_guess = response
    end

  end

  def previous_guess
    puts "Please pick your first card!"
    puts "Acceptable input is a number between 0 & #{@board.deck.length - 1}"
    response = gets.chomp.to_i 
    
    if exceed_deck_size?(response)
      @board.clear
      previous_guess
    else
      @first_guess = response
    end

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
    self.previous_guess
    @board.deck[@first_guess].reveal
    @board.clear

    self.current_guess
    @board.deck[@second_guess].reveal
    @board.clear

    duplicate?
  end

  def duplicate? 
    if @first_guess == @second_guess
      puts 'You cannot pick the same card in a turn!'
      sleep(2)
      @board.reset
      self.guess
    end
  end

  def exceed_deck_size?(input) 
    if input >= @board.deck.length || input >= @board.deck.length
      puts "Please select a number between 0 & #{@board.deck.length - 1}" 
      sleep(2)
      @board.reset
    end
  end

  def win
    @board.deck.length < 2
  end

end


