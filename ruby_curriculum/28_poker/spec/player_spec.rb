require 'rspec'
require 'player'

describe Player do 
  subject(:player) { Player.new }
  describe "#initialize" do 
    it 'provides a player with 100 chips' do 
      expect(player.chips).to eq(100)
    end
  end

end