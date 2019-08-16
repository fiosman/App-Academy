require_relative 'card'

class Hand
  attr_accessor :cards

  def initialize(cards=[])
    @cards = cards
  end

  def four_of_a_kind? 
    count_repeated_ranks.values.any? { |frequency| frequency == 4 } 
  end

  def three_of_a_kind? 
    count_repeated_ranks.values.any? { |frequency| frequency == 3 }
  end

  def flush? 
    count_repeated_suits.values.any? { |frequency| frequency == 5 }
  end

  def pair? 
    count_repeated_ranks.values.any? { |frequency| frequency == 2 } 
  end

  def two_pair? 
    pair_count = 0 
    count_repeated_ranks.values.each do |frequency| 
      pair_count += 1 if frequency == 2
    end
    return true if pair_count == 2 
    return false
  end

  def full_house? 
    pair? && three_of_a_kind?
  end

  def pair_suit_rank 
    self.cards.map { |card| [card.rank, card.suit] }
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
