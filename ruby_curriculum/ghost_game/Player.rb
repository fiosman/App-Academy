require_relative "Game"

class Player
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def prompt_guess
    puts "#{@name}, what letter would you like to guess?"
  end

  def guessed_letter
    gets.chomp.downcase
  end
  
  def alert_invalid_guess
    puts 'Fragment must form a valid English word! :)'
  end
  
end
