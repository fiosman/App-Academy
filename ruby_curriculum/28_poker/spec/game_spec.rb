require 'rspec'
require 'game'

describe Game do 

  let(:chris) { Player.new('Chris') }
  let(:andrew) { Player.new('Andrew') }
  let(:fares) { Player.new('Fares') }
  subject(:game) { Game.new(chris, andrew, fares) }

  describe "#initialize" do 
    it 'sets a deck of cards' do  
      expect(game.deck).to all(be_a(Card))
    end
    it 'sets up players for the game' do 
      expect(game.players[0].name).to eq('Chris')
      expect(game.players[1].name).to eq('Andrew')
      expect(game.players[2].name).to eq('Fares')
    end
    it 'sets the pot amount to 0 initially' do 
      game.pot.should be_zero 
    end
  end

  describe "#deal_cards" do 
    it 'assigns 5 cards to each player, one at a time' do 
      chris_hand = [game.deck[51], game.deck[48], game.deck[45], game.deck[42], game.deck[39]]
      andrew_hand = [game.deck[50], game.deck[47], game.deck[44], game.deck[41], game.deck[38]]
      fares_hand = [game.deck[49], game.deck[46], game.deck[43], game.deck[40], game.deck[37]]
      game.deal_cards
      game.players.each do |player| 
        expect(player.hand.cards.length).to eq(5)
        expect(player.hand.cards.all? { |card| card.is_a?(Card) }).to be_truthy
      end
      expect(game.players[0].hand.cards).to eq(chris_hand)
      expect(game.players[1].hand.cards).to eq(andrew_hand)
      expect(game.players[2].hand.cards).to eq(fares_hand)
    end

    it 'selects cards from top of the deck' do 
      selected_cards = game.deck[36..-1]
      game.deal_cards 
      game.players.each do |player| 
        expect(player.hand.cards.all? { |card| selected_cards.include?(card) }).to be_truthy
      end
    end

    it 'removes the dealt cards from the deck' do 
      game.deal_cards
      expect(game.deck.length).to eq(37)
      game.players.each do |player| 
        expect(player.hand.cards.all? { |card| game.deck.include?(card) }).to be_falsy
      end
    end
  end

end