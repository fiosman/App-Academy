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

  let(:royal_flush) { [
    double('card', rank: :ace, suit: :diamonds), 
    double('card', rank: :king, suit: :diamonds), 
    double('card', rank: :queen, suit: :diamonds), 
    double('card', rank: :jack, suit: :diamonds), 
    double('card', rank: 10, suit: :diamonds)
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

  describe "#count_repeated_ranks" do 
    let(:rank_frequencies) { { 4=>1, 3=>2, :queen=>1, :jack=>1 } }
    let(:ranks_hash) { hand.count_repeated_ranks }
    it 'returns a hash containing frequencies of each rank within a hand' do 
      expect(ranks_hash).to eq(rank_frequencies)
    end
    it 'hash contains every rank in the hand' do 
      hand.cards.each do |card| 
        expect(ranks_hash).to have_key(card.rank)
      end
    end
  end

  describe "#count_repeated_suits" do 
    let(:suit_frequencies) { { :diamonds=>2, :spades=>1, :hearts=>1, :clubs=>1 } }
    let(:suits_hash) { hand.count_repeated_suits }
    it 'returns a hash containing frequencies of each suit within a hand' do 
      expect(suits_hash).to eq(suit_frequencies)
    end
    it 'hash contains every suit in the hand' do 
      hand.cards.each do |card| 
        expect(suits_hash).to have_key(card.suit)
      end
    end
  end

  describe "#four_of_a_kind?" do 
    context 'when four cards have the same rank' do 
      before do 
        hand.cards[3] = double('card', rank: 3, suit: :diamonds)
        hand.cards[4] = double('card', rank: 3, suit: :clubs)
      end
      it 'returns true' do 
        expect(hand).to be_four_of_a_kind
      end
    end
    context 'when four cards do not have the same rank' do 
      it 'returns false' do 
        expect(hand).not_to be_four_of_a_kind
      end
    end
  end

  describe "#two_pair?" do 
    context 'when each pair of cards has the same rank' do 
      before { hand.cards[3] = double('card', rank: 4, suit: :diamonds) }   
      it 'returns true' do 
        expect(hand).to be_two_pair
      end
    end
    context 'when there are no two pairs' do 
      before { hand.cards[3] = double('card', rank: 3, suit: :diamonds) }
      it 'returns false' do 
        expect(hand).not_to be_two_pair
      end
    end
  end

  describe "#pair?" do 
    context 'when two cards have the same rank' do 
      it 'returns true' do 
        expect(hand).to be_pair 
      end
    end
    context 'when there are no two cards with the same rank' do 
      before { hand.cards[1] = double('card', rank: 7, suit: :spades) }
      it 'returns false' do 
        expect(hand).not_to be_pair
      end
    end
    context 'when there are more than two cards with the same rank' do 
      before { hand.cards[0] = double('card', rank: 3, suit: :diamonds) }  
      it 'returns false' do 
        expect(hand).not_to be_pair
      end
    end
  end

  describe "#high_card?" do
  end

  describe "#royal_flush?" do 
    context 'when hand is a royal flush' do 
      before { hand.cards = royal_flush }
      it 'returns true' do 
        expect(hand).to be_royal_flush 
      end
    end
    context 'when hand is not a royal flush' do 
      it 'returns false' do 
        expect(hand).not_to be_royal_flush
      end
    end
  end

  describe "#three_of_a_kind?" do
    context 'when three cards have the same rank' do 
      before { hand.cards[0] = double('card', rank: 3, suit: :diamonds) }
      it 'returns true' do 
        expect(hand).to be_three_of_a_kind
      end
    end
    context 'when three cards do not have the same rank' do 
      it 'returns false' do 
        expect(hand).not_to be_three_of_a_kind
      end
    end
  end

  describe "#straight_flush?" do 
  end

  describe "#flush?" do 
    context 'when all cards have the same suit' do 
      before do 
        hand.cards = [ 
          double('card', rank: 4, suit: :diamonds), 
          double('card', rank: :jack, suit: :diamonds), 
          double('card', rank: 6, suit: :diamonds), 
          double('card', rank: :king, suit: :diamonds), 
          double('card', rank: :queen, suit: :diamonds)
        ]
      end
      it 'returns true' do 
        expect(hand).to be_flush
      end
    end
    context 'when all cards do not havec the same suit' do 
      it 'returns false' do 
        expect(hand).not_to be_flush
      end
    end
  end

  describe "#full_house?" do 
    context 'when a hand consists of three of a kind and a pair' do 
      before do 
        hand.cards = [ 
          double('card', rank: 4, suit: :clubs), 
          double('card', rank: 4, suit: :diamonds), 
          double('card', rank: :king, suit: :spades), 
          double('card', rank: 4, suit: :spades), 
          double('card', rank: :king, suit: :hearts)
        ]
      end
      it 'returns true' do
        expect(hand).to be_full_house
      end
    end
    context 'when a hand does not have a pair and three of a kind' do 
        it 'returns false' do 
          expect(hand).not_to be_full_house
      end
    end
  end


end

