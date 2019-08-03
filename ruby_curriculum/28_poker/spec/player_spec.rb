require 'rspec'
require 'player'

describe Player do 
  subject(:player) { Player.new }

  describe "#initialize" do 
    it 'provides a player with 100 chips' do 
      expect(player.chips).to eq(100)
    end
    it 'provides a player with a deck of cards' do 
      expect(player.deck.deck.all? { |card| card.is_a?(Card) }).to be_truthy
    end 
  end

end