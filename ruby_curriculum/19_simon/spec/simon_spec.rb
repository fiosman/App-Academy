require 'simon'

describe Simon do
  subject(:simon) { Simon.new }

  describe '#initialize' do
    it 'starts the sequence length at 1' do
      expect(simon.sequence_length).to eq(1)
    end

    it 'starts game over as false' do
      expect(simon.game_over).to be(false)
    end

    it 'starts the sequence as an empty array' do
      expect(simon.seq).to be_empty
    end
  end

  describe '#add_random_color' do
    before(:each) { simon.add_random_color }

    it 'adds one color to the sequence' do
      expect(simon.sequence_length).to eq(1)
    end

    it 'adds a color included in the options' do
      expect(%w(red blue yellow green)).to include(simon.seq.last)
    end

    it 'adds a random color' do
      simon.add_random_color
      simon.add_random_color
      simon.add_random_color
      simon.add_random_color
      simon.add_random_color
      simon.add_random_color
      simon.add_random_color
      simon.add_random_color
      expect(simon.seq.all? { |color| color == simon.seq[0] }).to be(false)
    end
  end

  describe '#take_turn' do
    it 'calls #show_sequence and #require_sequence' do
      expect(simon).to receive(:show_sequence)
      expect(simon).to receive(:require_sequence)
      simon.take_turn
    end

    context 'when the game is not over' do
      before(:each) do
        allow(simon).to receive(:show_sequence)
        allow(simon).to receive(:require_sequence)
      end

      it 'calls #round_success_message' do
        expect(simon).to receive(:round_success_message)
        simon.take_turn
      end

      it 'increments the sequence length' do
        simon.take_turn
        expect(simon.sequence_length).to eq(2)
      end
    end
  end

  describe '#play' do
    it 'calls #take_turn' do
      expect(simon).to receive(:take_turn) { simon.game_over = true }
      simon.play
    end

    it 'calls #take_turn until the game is over' do
      expect(simon).to receive(:take_turn) {  }
      expect(simon).to receive(:take_turn) {  }
      expect(simon).to receive(:take_turn) { simon.game_over = true }

      simon.play
    end

    it 'calls #game_over_message and #reset_game if the game is over' do
      simon.game_over = true
      expect(simon).to receive(:game_over_message)
      expect(simon).to receive(:reset_game)
      simon.play
    end
  end

  describe '#show_sequence' do
    it 'calls #add_random_color' do
      expect(simon).to receive(:add_random_color)
      simon.show_sequence
    end
  end

  describe '#reset_game' do
    before(:each) do
      simon.sequence_length = 4
      simon.seq = ["blue", "red", "green"]
      simon.game_over = true
      simon.reset_game
    end

    it 'resets the sequence length to 1' do
      expect(simon.sequence_length).to eq(1)
    end

    it 'resets game over to false' do
      expect(simon.game_over).to be(false)
    end

    it 'resets the sequence to an empty array' do
      expect(simon.seq).to be_empty
    end
  end
end
