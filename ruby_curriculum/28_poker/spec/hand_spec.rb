require 'rspec'
require 'hand'
require 'game'
require 'deck'

describe Hand do 
  let(:player) { Player.new('Fares') }
  let(:game) { Game.new(player) }
  let(:hand) { game.players[0].hand }
  
  describe "#initialize" do 
    it 'contains 5 cards from the deck' do 
      player_cards = game.deck[47..51]
      game.deal_cards
      expect(game.players[0].hand.cards).to match_array(player_cards)
    end
  end

  describe "pairing of cards" do
    before(:each) { game.deal_cards }
    describe "#pair_suit_rank" do 
      it 'returns a 2D array, with sub-arrays containing rank/suit pairs' do 
        paired_cards = hand.pair_suit_rank 
        hand.cards.each_with_index do |card, idx| 
          expect(card.rank).to eq(paired_cards[idx].first)
          expect(card.suit).to eq(paired_cards[idx].last)
        end
        expect(paired_cards.all? { |pair| pair.is_a?(Array) }).to be_truthy
      end
    end

    describe "#pair_by_rank" do 
      it 'returns an array containing all the card ranks of a hand' do 
        paired_ranks = hand.pair_by_rank
        hand.cards.each_with_index do |card, idx| 
          expect(card.rank).to eq(paired_ranks[idx])
        end
      end
    end

    describe "#pair_by_suit" do 
      it 'returns an array containing all the card suits of a hand' do 
        paired_suits = hand.pair_by_suit
        hand.cards.each_with_index do |card, idx| 
          expect(card.suit).to eq(paired_suits[idx])
        end
      end
    end
  end
  
end

