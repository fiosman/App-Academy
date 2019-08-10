require 'rspec'
require 'game'

describe Game do 

  let(:chris) { Player.new('Chris') }
  let(:andrew) { Player.new('Andrew') }
  let(:fares) { Player.new('Fares') }
  let(:deck) { Deck.new }
  subject(:game) { Game.new(chris, andrew, fares) }

  describe "#initialize" do 
    it 'sets a deck of cards' do  
      expect(game.deck.all? { |card| card.is_a?(Card) }).to be_truthy
    end
    it 'sets up players for the game' do 
      expect(game.players[0].name).to eq('Chris')
      expect(game.players[1].name).to eq('Andrew')
      expect(game.players[2].name).to eq('Fares')
    end
  end

  describe "#deal_cards" do 
    it 'assigns 5 cards to each player' do 
      expect(game.players)
    end

  end

end