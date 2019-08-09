require 'rspec'
require 'hand'
require 'deck'

describe Hand do 
  let(:deck) { Deck.new }
  subject(:hand) { Hand.new(deck) }

  describe "#initialize" do 
    it 'has a deck from which cards are picked' do
      expect(hand.deck).to eq(deck)
    end
  end

end

