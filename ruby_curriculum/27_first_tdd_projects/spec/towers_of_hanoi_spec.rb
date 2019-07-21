require 'rspec'
require 'towers_of_hanoi'

describe "#Game" do 
  subject(:hanoi) { Game.new }

  describe "#initialize" do 
    it "sets up 2D array with three sub-arrays" do 
      expect(hanoi.towers.all? { |tower| tower.is_a?(Array) }).to be_truthy
      expect(hanoi.towers.length).to eq(3)
    end
    it "starts with the proper orientation" do 
      expect(hanoi.towers).to eq([[3,2,1], [], []])
    end
  end

  describe "#move" do 
    it 'moves a smaller disk onto bigger disk' do 
      hanoi.move(0,1)
      expect(hanoi.towers).to eq([[3 , 2], [1], []])
    end
    it 'does not move a larger disk onto smaller disk' do 
      hanoi.move(0,1)
      expect(hanoi.towers[1]).not_to include(3,2)
    end
  end

  describe "#valid_move?" do 
    it 'returns false if starting position is an empty array' do 
      expect(hanoi.valid_move?(1,0)).to be_falsy
    end
    it 'returns true if ending position is an empty array' do 
      expect(hanoi.valid_move?(0,2)).to be_truthy
    end
  end

  describe "#won?" do 
    let(:winning) { Game.new([[], [3, 2, 1], []]) }
    it 'returns true if towers 1 or 2 have the orientation [3,2,1]' do 
      expect(winning.won?).to be_truthy
    end
    it 'returns false if orientation is still default' do
      expect(hanoi.won?).to be_falsy
    end
  end

end