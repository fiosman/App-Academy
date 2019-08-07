require 'rspec'
require 'game'

describe Game do 
  subject(:game) { Game.new }

  describe "#initialize" do 
    it 'sets a deck of cards' do  
      expect(game.deck.is_a?(Deck)).to be_truthy
    end
  end

end