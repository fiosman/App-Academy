require_relative 'deck'

class Player
  attr_reader :deck 
  attr_accessor :chips 

  def initialize  
    @chips = 100
    @deck = Deck.new
  end

end