require 'rspec'
require 'board'
require 'spec_helper'

describe Board do
  subject(:board) do
    Board.new("Erica", "James")
  end

  let(:six_stone_cup) do
    [:stone, :stone, :stone, :stone, :stone, :stone]
  end
  let(:five_stone_cup) do
    [:stone, :stone, :stone, :stone, :stone]
  end
  let(:four_stone_cup) do
    [:stone, :stone, :stone, :stone]
  end


  describe "#initialize" do
    it "creates a set of 14 cups" do
      expect(board.cups.class).to be(Array)
      expect(board.cups.length).to eq(14)
    end

    it "fills the non-store cups with four stones" do
      expect(board.cups[6] && board.cups[13]).to be_empty
      expect(board.cups[0..5]).to all( eq(four_stone_cup) )
    end
  end


  describe "#valid_move?" do
    before(:each) do
      board.cups[0] = []
    end

    it "raises 'Invalid starting cup' error if the entered position is not on the board" do
      expect do
        board.valid_move?(15)
      end.to raise_error("Invalid starting cup")
    end

    it "raises 'Starting cup is empty' if the entered position is empty" do
      expect do
        board.valid_move?(0)
      end.to raise_error("Starting cup is empty")
    end
  end


  describe "#make_move" do
    before(:each) do
      board.make_move(0, "Erica")
    end

    it "empties the selected cup" do
      expect(board.cups[0]).to be_empty
    end

    it "distributes the stones from the selected cup" do
      expect(board.cups[1..4]).to all( eq(five_stone_cup))
      expect(board.cups[5]).to eq( four_stone_cup )
      expect(board.cups[7..12]).to all(eq(four_stone_cup))
    end

    it "places stones in the current player's cup" do
      board.make_move(5, "Erica")
      expect(board.cups[6]).to eq([:stone])
    end

    it "doesn't place stones in the opponent's cup" do
      # not a starting move; assumed to be an automatic move after finishing a play on this cup full of stones
      board.make_move(12, "Erica")
      expect(board.cups[13]).to be_empty
      expect(board.cups[3]).to eq( six_stone_cup )
    end

    it "calls #render at the end of each turn" do
      expect(board).to receive(:render)
      board.make_move(1, "Erica")
    end

    it "calls helper method #next_turn" do
      expect(board).to receive(:next_turn)
      board.make_move(1, "Erica")
    end

    context "when the turn ended on an empty cup" do
      it "returns :switch" do
        expect(board.make_move(10, "James")).to eq(:switch)
      end
    end

    context "when the turn ended on the current player's points cup" do
      it "returns :prompt" do
        expect(board.make_move(9, "James")).to eq(:prompt)
      end
    end

    context "when the turn ended on a cup with stones already in it" do
      it "returns the cup's array index" do
        expect(board.make_move(5, "Erica")).to eq(9)
      end
    end
  end


  describe "#one_side_empty?" do
    it "returns true if one side of non-point cups is empty" do
      (0..5).each { |idx| board.cups[idx] = [] }
      expect(board.one_side_empty?).to be(true)
    end

    it "returns false if neither side of non-point cups is empty" do
      expect(board.one_side_empty?).to be(false)
    end
  end


  describe "#winner" do
    it "returns :draw if the game was tied" do
      board.cups[6] = six_stone_cup
      board.cups[13] = six_stone_cup
      expect(board.winner).to eq(:draw)
    end

    it "returns the winner's name if the game was won" do
      board.cups[6] = six_stone_cup
      board.cups[13] = five_stone_cup
      expect(board.winner).to eq("Erica")
    end
  end
end
