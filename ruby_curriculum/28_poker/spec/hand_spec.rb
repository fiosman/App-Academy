require 'rspec'
require 'hand'
require 'deck'

describe Hand do 
  let(:sample_hand) { [[:ace, :spades], [3, :diamonds],
                      [4, :spades], [:king, :hearts], 
                      [:ace, :clubs]] }
  subject(:hand) { Hand.new(sample_hand) }

  describe "#initialize" do 
    it 'takes in a hand' do 
      expect(hand.hand).to eq(sample_hand)
    end
  end
end

