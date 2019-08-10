require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :deck, :players

  def initialize(*players)
    @deck = Deck.new.shuffle_deck
    @players = players
  end

  def deal_cards
    until @players.all? { |player| player.hand.length == 5 } 
      @players.each do |player|
        dealt_card = deck.pop
        player.hand << dealt_card
      end
    end
  end
end
