class Card
  attr_reader :value

  def self.cards 
    [:ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]
  end

  def self.suits 
    [:spades, :diamonds, :clubs, :hearts]
  end

  def initialize
    @value = { Card.suits.sample => Card.cards.sample }
  end
end