require_relative 'board'

class Player

  attr_accessor :board, :first_guess, :second_guess
  
  def initialize
     @board = Board.new
     @first_guess = nil  
     @second_guess = nil
  end
  
  def current_guess
    puts "Please pick your second card!"
    response = gets.chomp.to_i
    
    if !guess_not_valid?(response)
      print "Please select one of the cards displayed!"
      sleep(2)
      @board.clear
      current_guess 
    else
      @second_guess = response
    end 
  end

  def previous_guess
    puts "Please pick your first card!"
    response = gets.chomp.to_i 
    
    if !guess_not_valid?(response)
      print "Please select one of the cards displayed!"
      sleep(2)
      @board.clear
      previous_guess
    else
      @first_guess = response
    end
  end

  def compare_guesses
    if @board.deck[@board.get_card_pos(@first_guess)].revealed_value == @board.deck[@board.get_card_pos(@second_guess)].revealed_value
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
    @board.deck[@board.get_card_pos(@first_guess)].reveal
    @board.clear

    self.current_guess
    @board.deck[@board.get_card_pos(@second_guess)].reveal
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

  def guess_not_valid?(input) 
    @board.deck.any? { |card| card.numerical_value == input }
  end

  def win
    @board.deck.length < 2
  end

end

