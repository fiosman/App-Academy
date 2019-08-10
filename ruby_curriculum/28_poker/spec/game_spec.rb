require 'rspec'
require 'game'

describe Game do 

  let(:chris) { Player.new('Chris') }
  let(:andrew) { Player.new('Andrew') }
  let(:fares) { Player.new('Fares') }
  let(:deck) { Game.new.deck }
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
  before(:each) { game.deal_cards } 
    it 'assigns 5 cards to each player' do 
      game.players.each do |player| 
        expect(player.hand.length).to eq(5)
        expect(player.hand.all? { |card| card.is_a?(Card) })
      end
    end
    it 'takes the cards from the game deck' do 
      game.players.each do |player| 
        expect(player.hand.all? { |card| deck.include?(card) })
      end
    end
    it 'selects cards from top of the deck' do 

    end
    # it 'removes the dealt cards from the deck' do 
    #   game.players.each do |player| 

    #   end
  end

end