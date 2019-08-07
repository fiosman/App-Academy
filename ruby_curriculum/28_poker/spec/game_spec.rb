require 'rspec'
require 'game'

describe Game do 
  subject(:game) { Game.new }

  describe "#initialize" do 
    it 'sets a deck of cards' do 
      deck = Deck.new
      expect(game.deck).to eq(deck)
    end
  end

end