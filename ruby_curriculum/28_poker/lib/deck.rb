require_relative 'card'

class Deck
  attr_reader :deck 

  def self.ranks
    [:ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]
  end

  def self.suits 
    [:spades, :diamonds, :clubs, :hearts]
  end

  def initialize
    @deck = populate_deck
  end

  def populate_deck
    Deck.suits.map { |suit| Deck.ranks.map { |rank| Card.new(rank, suit) } }.flatten
  end

  def shuffle_deck
    @deck.shuffle!
  end

end
