require 'rspec'
require 'towers_of_hanoi'

describe "#Game" do 
  subject(:hanoi) { Game.new }

  describe "#initialize" do 
    it "sets up 2D array with three sub-arrays" do 
      expect(hanoi.towers.all? { |tower| tower.is_a?(Array) }).to eq(true)
      expect(hanoi.towers.length).to eq(3)
    end
    it "starts with the proper orientation" do 
      expect(hanoi.towers).to eq([[3,2,1], [], []])
    end
  end

  describe "#move" do 
    it 'moves a smaller disk onto bigger disk' do 
      hanoi.move(0,1)
      expect(hanoi.towers).to eq([[3,2], [1], []])
    end
    it 'does not move a larger disk onto smaller disk' do 
      hanoi.move(0,1)
      expect(hanoi.towers[1]).not_to include(3,2)
    end
  end


end