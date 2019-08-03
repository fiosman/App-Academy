require 'rspec'
require 'card'

describe Card do 
  subject(:card) { Card.new }

  describe "#initialize" do 
    it 'assigns a random card of a certain suit from the deck' do 
      expect(Card.cards).to include(card.value.values.first)
      expect(Card.suits).to include(card.value.keys.first)
      expect(card.value).to be_a Hash
    end
  end

end