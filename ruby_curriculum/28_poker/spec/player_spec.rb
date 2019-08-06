require 'rspec'
require 'player'

describe Player do 
  let(:hand) { [[:ace, :spades], [3, :diamonds],
               [4, :spades], [:king, :hearts], 
               [:ace, :clubs]] }
  subject(:player) { Player.new('Fares', :hand) }

  describe "#initialize" do 
    it 'provides a player with 100 chips' do 
      expect(player.chips).to eq(100)
    end
    it 'sets a player name' do 
      expect(player.name).to eq('Fares')
    end
    it 'assigns a hand to player' do 
      expect(player.hand). to eq(:hand)
    end
    it 'modifies the chip amount throughout the game' do 
      player.chips -= 10 
      expect(player.chips).to eq(90)
    end
  end

  describe "#fold" do 
    it 'allows player to fold' 
  end

  describe "#raise" do 
    it 'allows a player to raise'
  end

  describe "#call" do 
    it 'allows player to call' 
  end

  describe "#discard" do 
    it 'allows a player to discard an amount of cards'
  end
end