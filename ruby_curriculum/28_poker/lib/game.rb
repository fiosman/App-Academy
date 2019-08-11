require_relative 'deck'
require_relative 'player'
require_relative 'hand'

class Game
  attr_reader :deck, :players
  attr_accessor :pot

  def initialize(*players)
    @deck = Deck.new.shuffle_deck
    @players = players
    @pot = 0
  end

  def deal_cards
    until @players.all? { |player| player.hand.cards.length == 5 } 
      @players.each do |player|
        dealt_card = deck.pop
        player.hand.cards << dealt_card
      end
    end
  end
end
