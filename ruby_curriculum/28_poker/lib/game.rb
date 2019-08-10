require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :deck, :players

  def initialize(*players)
    @deck = Deck.new.shuffle_deck
    @players = players
  end

  def deal_cards
    @players.each do |player|
      5.times do
        dealt_card = @deck.shift
        player.hand << dealt_card
      end
    end
  end
end
