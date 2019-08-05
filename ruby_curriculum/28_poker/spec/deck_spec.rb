require 'rspec'
require 'deck'

describe Deck do
  subject(:game_deck) { Deck.new }
  let(:ranks) {[:ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]}
  let(:suits) {[:spades, :diamonds, :clubs, :hearts]}

  describe "::ranks" do 
    it 'should return an array of the card ranks'  do 
      expect(Deck.ranks).to eq(ranks)
    end
  end

  describe "::suits" do 
    it 'should return an array of the card suits' do 
      expect(Deck.suits).to eq(suits)
    end
  end

  describe "#initialize" do 
    it 'sets up an array of 52 cards' do 
      expect(game_deck.deck.is_a?(Array)).to be_truthy
      expect(game_deck.deck.length).to eq(52)
    end
    it 'ensures the deck includes all combinations of suits/ranks' do 
      expect(game_deck.deck.all? { |card| ranks.include?(card.rank) }).to be_truthy
      expect(game_deck.deck.all? { |card| suits.include?(card.suit) }).to be_truthy
    end
  end

  describe "#populate_deck" do 
    it 'ensures the deck is a 1D array of Card instances' do 
      expect(game_deck.deck.all? { |card| card.is_a?(Array) }).to be_falsy
      expect(game_deck.deck.all? { |card| card.is_a?(Card) }).to be_truthy
    end
  end

  describe "#shuffle_deck" do 
  let(:unshuffled_deck) { Deck.new }
    it 'shuffles the deck of cards' do 
      old_deck = unshuffled_deck.deck 
      unshuffled_deck.shuffle_deck 
      expect(old_deck).not_to eq(unshuffled_deck)
    end
  end
end