require_relative 'card'

class Hand
  attr_accessor :cards

  def initialize(cards=[])
    @cards = cards
  end

  def pair_suit_rank 
    self.cards.map { |card| [card.rank, card.suit] }
  end

  def pair_by_rank 
    self.cards.map(&:rank)
  end

  def pair_by_suit 
    self.cards.map(&:suit)
  end

  def four_of_a_kind? 
    ranks = pair_by_rank
    ranks.each do |rank| 
      return true if ranks.count(rank) == 4
      return false
    end
  end

end
