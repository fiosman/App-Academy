require 'rspec'
require 'player'

describe Player do 
  subject(:player) { Player.new('Fares') }

  describe "#initialize" do 
    it 'provides a player with 100 chips' do 
      expect(player.chips).to eq(100)
    end
    it 'sets a player name' do 
      expect(player.name).to eq('Fares')
    end
    it 'assigns a hand to player' do 
      expect(player.hand).to be_empty
    end
    it 'modifies the chip amount throughout the game' do 
      player.chips -= 10 
      expect(player.chips).to eq(90)
    end
  end

  describe "#pay_ante" do 
   let(:ante) { 5 }
   let(:pot) { 0 }
    it 'pays the ante price, adds it to the pot, and deducts player chip amount' do
      player.pay_ante(pot, ante)
      expect(player.chips).to eq(95)
      expect(pot).to eq(5)
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
    it 'allows a player to discard any cards they pick'
  end
end