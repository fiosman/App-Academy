require 'rspec'
require 'deck'

describe Deck do
  subject(:sample_deck) { Deck.new }

  describe "#initialize" do
    it 'sets up a deck of five cards' do 
      expect(sample_deck.deck.count).to eq(5)
    end
  end
end