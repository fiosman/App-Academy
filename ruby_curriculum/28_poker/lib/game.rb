require_relative 'deck'

class Game
  attr_reader :deck

  def initialize
    @deck = Deck.new 
  end
end