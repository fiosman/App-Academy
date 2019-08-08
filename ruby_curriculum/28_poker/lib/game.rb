require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :deck, :players

  def initialize(*players)
    @deck = Deck.new
    @players = players.map(&:generate_ID)
  end
end
