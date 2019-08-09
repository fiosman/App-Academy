require 'rspec'
require 'game'

describe Game do 
  
  let(:fares_hand) { [[:ace, :spades], [3, :diamonds],
               [4, :spades], [:king, :hearts], 
               [:ace, :clubs]] }
  let(:chris_hand) { [[:ace, :spades], [3, :diamonds],
               [4, :spades], [:king, :hearts], 
               [:ace, :clubs]] }
  let(:competitors) { [{'Fares' => [fares_hand, 100]}, 
                       {'Chris' => [chris_hand, 100]}] 
                    }
  subject(:game) { Game.new(Player.new('Fares', fares_hand), Player.new('Chris', chris_hand)) }

  describe "#initialize" do 
    it 'sets a deck of cards' do  
      expect(game.deck.is_a?(Deck)).to be_truthy
    end
    it 'should take in players and return an array of their IDs' do 
      expect(game.players).to eq(competitors)
    end
  end

  describe "#deal_cards" do 
    it 'assigns 5 cards to each player'
  end

end