require_relative 'card'

class Hand
  attr_accessor :cards

  def initialize(cards=[])
    @cards = cards
  end

  def pair_suit_rank 
    self.cards.map { |card| [card.rank, card.suit] }
  end

  def four_of_a_kind? 
  end

  def count_repeated_ranks 
    rank_frequencies = Hash.new(0)
    self.cards.each do |card|  
      rank_frequencies[card.rank] += 1 
    end 
    rank_frequencies
  end

  def count_repeated_suits 
    suit_frequencies = Hash.new(0)
    self.cards.each do |card| 
      suit_frequencies[card.suit] += 1
    end
    suit_frequencies
  end

end
