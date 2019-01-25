require "board"

# The code below suppresses stdout while rspec runs.
#################################################################
RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout
  config.before(:all) do
    $stderr = File.open(File::NULL, "w")
    $stdout = File.open(File::NULL, "w")
  end
  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end
end
#################################################################

puts "\nNOTE: Once you complete all specs, run `ruby lib/play_battleship.rb` in your terminal!"

describe "Board" do
  let(:board) { Board.new(10) }

  describe "PART 1" do
    describe "#initialize" do
      it "should accept a number, n, as an arg" do
        board
      end

      it "should set @grid to be a 2D array with n rows and n columns" do
        grid = board.instance_variable_get(:@grid)
        expect(grid.length).to eq(10)
        expect(grid[0].length).to eq(10)

        small_grid = Board.new(4).instance_variable_get(:@grid)
        expect(small_grid.length).to eq(4)
        expect(small_grid[0].length).to eq(4)
      end

      it "should set all elements of @grid to :N" do
        grid = board.instance_variable_get(:@grid)
        nil_grid = Array.new(10) { Array.new(10, :N) }
        expect(grid).to eq(nil_grid)
      end

      it "should make each subarray of @grid refer to a distinct array" do
        grid = board.instance_variable_get(:@grid)
        expect(grid[0]).to_not be(grid[1])
      end

      it "should set @size to be a number representing the total size of the grid (n * n)" do
        expect(board.instance_variable_get(:@size)).to eq(100)

        small_board = Board.new(4)
        expect(small_board.instance_variable_get(:@size)).to eq(16)
      end
    end

    describe "#size" do
      it "should get (return) @size" do
        expect(board.size).to be(board.instance_variable_get(:@size))
      end
    end

    describe "#[]" do
      it "should accept an array containing a pair of indices in the form [row, column] representing a position on the @board" do
        pos = [2, 4]
        board[pos]
      end

      it "should return the element of @grid at the given position" do
        grid = board.instance_variable_get(:@grid)
        grid[2][4] = :S

        pos_1 = [2, 4]
        expect(board[pos_1]).to eq(:S)

        pos_2 = [0, 0]
        expect(board[pos_2]).to be(:N)
      end
    end

    describe "#[]=" do
      it "should accept a position and value as args" do
        pos = [2, 4]
                              # Hint:
        board[pos] = :S       # this line...
        board.[]=(pos, :S)    # is same as this line. :)
      end

      it "should set the given position of @grid to the given value" do
        pos_1 = [2, 4]
        board[pos_1] = :S
        expect(board[pos_1]).to eq(:S)

        pos_2 = [5, 1]
        board[pos_1] = :X
        expect(board[pos_1]).to eq(:X)
      end
    end

    describe "#num_ships" do
      it "should return a number representing the count of :S values in @grid" do
        expect(board.num_ships).to eq(0)

        board[[0, 0]] = :S
        board[[1, 0]] = :S
        expect(board.num_ships).to eq(2)
      end
    end
  end

  describe "PART 2" do
    describe "#attack" do
      it "should accept a position as an arg" do
        board.attack([5, 1])
      end

      context "when the given position of @grid has a value of :S" do
        it "should set that value to :H" do
          pos = [2, 4]
          board[pos] = :S

          board.attack(pos)
          expect(board[pos]).to eq(:H)
        end

        it "should print 'you sunk my battleship!'" do
          pos = [2, 4]
          board[pos] = :S
          expect { board.attack(pos) }.to output(/sunk/).to_stdout
        end

        it "should return true to indicate the attack hit a ship" do
          pos = [2, 4]
          board[pos] = :S

          expect(board.attack(pos)).to eq(true)
        end
      end

      context "when the given position of @grid does not have a value of :S" do
        it "should set that value to :X" do
          pos = [2, 4]
          board.attack(pos)
          expect(board[pos]).to eq(:X)
        end

        it "should return false to indicate the attack missed" do
          pos = [2, 4]
          expect(board.attack(pos)).to eq(false)
        end
      end

      it "should call Board#[] and Board#[]= to check and set @grid" do
        expect(board).to receive(:[])
        expect(board).to receive(:[]=)
        board.attack([2, 4])
      end
    end

    describe "#place_random_ships" do
      it "should randomly set 25% of the @grid's elements to :S" do
        board.place_random_ships
        grid = board.instance_variable_get(:@grid)
        ship_count = grid.map { |row| row.count(:S) }.sum
        expect(ship_count).to eq(25)
      end

      it "should always set 25% of the @grid's elements based on the @grid's dimensions" do
        small_board = Board.new(6)
        small_board.place_random_ships
        grid = small_board.instance_variable_get(:@grid)
        ship_count = grid.flatten.count(:S)
        expect(ship_count).to eq(9)
      end
    end

    describe "#hidden_ships_grid" do
      it "should return a 2D array representing the grid where every :S is replaced with an :N" do
        board = Board.new(2)

        real_grid = [
          [:S, :N],
          [:X, :S]
        ]

        hidden_grid = [
          [:N, :N],
          [:X, :N]
        ]

        board.instance_variable_set(:@grid, real_grid)
        expect(board.hidden_ships_grid).to eq(hidden_grid)
      end

      it "should not mutate the original @grid" do
        board = Board.new(2)
        board.instance_variable_set(:@grid, [[:S, :N],[:X, :S]])
        board.hidden_ships_grid
        expect(board.instance_variable_get(:@grid)).to eq([[:S, :N],[:X, :S]])
      end
    end

    describe "::print_grid" do
      it "should accept a 2D array representing a grid as an arg" do
        Board.print_grid([[:S, :N],[:X, :S]])
      end

      it "should print each row of @grid so every element in a row is separated with a space" do
        expect { Board.print_grid([[:S, :N],[:X, :S]]) }.to output(/S N\nX S\n/).to_stdout
      end
    end

    describe "#cheat" do
      it "should call Board::print_grid with @grid as an arg" do
        board.place_random_ships
        grid = board.instance_variable_get(:@grid)
        expect(Board).to receive(:print_grid).with(grid)
        board.cheat
      end
    end

    describe "#print" do
      it "should call Board::print_grid with the #hidden_ships_grid as an arg" do
        board.place_random_ships
        expect(Board).to receive(:print_grid).with(board.hidden_ships_grid)
        board.print
      end
    end
  end
end
