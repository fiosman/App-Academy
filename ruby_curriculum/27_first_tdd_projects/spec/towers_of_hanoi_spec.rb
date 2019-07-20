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

  

end