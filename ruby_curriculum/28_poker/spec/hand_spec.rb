require 'rspec'
require 'hand'
require 'card'

describe Hand do 

  let(:cards) { [
    double('card', rank: 4, suit: :diamonds), 
    double('card', rank: 3, suit: :spades), 
    double('card', rank: 3, suit: :hearts), 
    double('card', rank: :queen, suit: :diamonds), 
    double('card', rank: :jack, suit: :clubs)
  ] }

  subject(:hand) { Hand.new(cards) }
  
  describe "#initialize" do 
    it 'contains 5 card objects' do 
      expect(hand.cards).to eq(cards)
    end
  end

  describe "#pair_suit_rank" do 
    let(:paired_hand) { [
      [4, :diamonds], 
      [3, :spades], 
      [3, :hearts], 
      [:queen, :diamonds], 
      [:jack, :clubs]
    ] }
    it 'returns a 2D array with sub-arrays containing rank/suit pairs' do 
      expect(hand.pair_suit_rank).to eq(paired_hand)
    end
  end

  describe "#pair_by_rank" do 
    let(:ranks) { [4, 3, 3, :queen, :jack] }
    it 'returns an array containing all the card ranks of a hand' do 
      expect(hand.pair_by_rank).to eq(ranks)
    end
  end

  describe "pair_by_suit" do 
    let(:suit) { [:diamonds, :spades, :hearts, :diamonds, :clubs] }
    it 'returns an array containing all the card suits of a hand' do 
      expect(hand.pair_by_suit).to eq(suit)
    end
  end

  describe "#four_of_a_kind?" do 
  end
end

