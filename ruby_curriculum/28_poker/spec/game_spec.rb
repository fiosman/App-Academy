require 'rspec'
require 'game'

describe Game do 

  let(:chris) { Player.new('Chris') }
  let(:andrew) { Player.new('Andrew') }
  let(:fares) { Player.new('Fares') }
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
    it 'assigns 5 cards to each player, one at a time' do 
      chris_hand = [game.deck[0], game.deck[3], game.deck[6], game.deck[9], game.deck[12]]
      andrew_hand = [game.deck[1], game.deck[4], game.deck[7], game.deck[10], game.deck[13]]
      fares_hand = [game.deck[2], game.deck[5], game.deck[8], game.deck[11], game.deck[14]]
      game.deal_cards
      game.players.each do |player| 
        expect(player.hand.length).to eq(5)
        expect(player.hand.all? { |card| card.is_a?(Card) }).to be_truthy
      end
      expect(game.players[0].hand).to eq(chris_hand)
      expect(game.players[1].hand).to eq(andrew_hand)
      expect(game.players[2].hand).to eq(fares_hand)
    end

    it 'selects cards from top of the deck' do 
      selected_cards = game.deck[0...15]
      game.deal_cards 
      game.players.each do |player| 
        expect(player.hand.all? { |card| selected_cards.include?(card) }).to be_truthy
      end
    end

    it 'removes the dealt cards from the deck' do 
      game.deal_cards
      expect(game.deck.length).to eq(37)
      game.players.each do |player| 
        expect(player.hand.all? { |card| game.deck.include?(card) }).to be_falsy
      end
    end
  end

end