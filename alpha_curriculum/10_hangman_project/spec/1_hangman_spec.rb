require "hangman"

describe "Hangman" do
  let(:hangman) { Hangman.new }

  describe "PART 2" do
    describe "#try_guess" do
      it "should accept a char as an arg" do
        hangman.try_guess("o")
      end

      it "should call Hangman#already_attempted?" do
        expect(hangman).to receive(:already_attempted?).with("o")
        hangman.try_guess("o")
      end

      context "if the char was already attempted" do
        it "should print 'that has already been attempted'" do
          hangman.instance_variable_set(:@attempted_chars, ["o"])
          expect { hangman.try_guess("o") }.to output(/already/).to_stdout
        end

        it "should return false to indicate the guess was previously attempted" do
          hangman.instance_variable_set(:@attempted_chars, ["o"])
          expect(hangman.try_guess("o")).to eq(false)
        end
      end

      context "if the char was not already attempted" do
        it "should add the char to @attempted_chars" do
          hangman.try_guess("o")
          expect(hangman.attempted_chars).to eq(["o"])

          hangman.try_guess("c")
          expect(hangman.attempted_chars).to eq(["o", "c"])

          hangman.try_guess("x")
          expect(hangman.attempted_chars).to eq(["o", "c", "x"])
        end

        it "should return true to indicate the guess was not previously attempted" do
          expect(hangman.try_guess("o")).to eq(true)
        end
      end

      context "if the char has no match indices in @secret_word" do
        it "should decrement @remaining_incorrect_guesses" do
          allow(Hangman).to receive(:random_word).and_return("bootcamp")

          hangman.try_guess("o")
          expect(hangman.remaining_incorrect_guesses).to eq(5)

          hangman.try_guess("x")
          expect(hangman.remaining_incorrect_guesses).to eq(4)
        end
      end

      it "should call Hangman#get_matching_indices with the char" do
        allow(Hangman).to receive(:random_word).and_return("bootcamp")
        allow(hangman).to receive(:get_matching_indices) { [1, 2] }
        expect(hangman).to receive(:get_matching_indices).with("o")
        hangman.try_guess("o")
      end

      it "should call Hangman#fill_indices with the char and it's matching indices" do
        allow(Hangman).to receive(:random_word).and_return("bootcamp")
        expect(hangman).to receive(:fill_indices).with("o", [1, 2])
        hangman.try_guess("o")
      end
    end

    describe "#ask_user_for_guess" do
      it "should print 'Enter a char:'" do
        allow(hangman).to receive(:gets).and_return("o\n")
        expect { hangman.ask_user_for_guess }.to output(/Enter a char/).to_stdout
      end

      it "should call gets.chomp to get input from the user " do
        char = double("o\n", :chomp => "o")
        allow(hangman).to receive(:gets).and_return(char)
        expect(char).to receive(:chomp)
        expect(hangman).to receive(:gets)
        hangman.ask_user_for_guess
      end

      it "should call Hangman#try_guess with the user's char" do
        char = double("o\n", :chomp => "o")
        allow(hangman).to receive(:gets).and_return(char)
        expect(hangman).to receive(:try_guess).with(char.chomp)
        hangman.ask_user_for_guess
      end

      it "should return the return value of Hangman#try_guess" do
        char = double("o\n", :chomp => "o")
        allow(hangman).to receive(:gets).and_return(char)

        allow(hangman).to receive(:try_guess).and_return(false)
        expect(hangman.ask_user_for_guess).to eq(false)

        allow(hangman).to receive(:try_guess).and_return(true)
        expect(hangman.ask_user_for_guess).to eq(true)
      end
    end

    describe "win?" do
      context "when @guess_word matches @secret_word" do
        it "should print 'WIN'" do
          allow(Hangman).to receive(:random_word).and_return("cat")
          hangman.instance_variable_set(:@guess_word, ["c", "a", "t"])
          expect { hangman.win? }.to output(/WIN/).to_stdout
        end

        it "should return true" do
          allow(Hangman).to receive(:random_word).and_return("cat")
          hangman.instance_variable_set(:@guess_word, ["c", "a", "t"])
          expect(hangman.win?).to eq(true)
        end
      end

      context "when @guess_word does not match @secret_word" do
        it "should return false" do
          allow(Hangman).to receive(:random_word).and_return("cat")
          hangman.instance_variable_set(:@guess_word, ["c", "_", "t"])
          expect(hangman.win?).to eq(false)
        end
      end
    end

    describe "lose?" do
      context "when @remaining_incorrect_guesses is 0" do
        it "should print 'LOSE'" do
          hangman.instance_variable_set(:@remaining_incorrect_guesses, 0)
          expect { hangman.lose? }.to output(/LOSE/).to_stdout
        end

        it "should return true" do
          hangman.instance_variable_set(:@remaining_incorrect_guesses, 0)
          expect(hangman.lose?).to eq(true)
        end
      end

      context "when @remaining_incorrect_guesses is not 0" do
        it "should return false" do
          hangman.instance_variable_set(:@remaining_incorrect_guesses, 2)
          expect(hangman.lose?).to eq(false)
        end
      end
    end

    describe "game_over?" do
      it "should call Hangman#win?" do
        allow(hangman).to receive(:lose?).and_return(false)
        allow(hangman).to receive(:win?).and_return(true)
        expect(hangman).to receive(:win?)
        hangman.game_over?
      end

      it "should call Hangman#lose?" do
        allow(hangman).to receive(:win?).and_return(false)
        allow(hangman).to receive(:lose?).and_return(true)
        expect(hangman).to receive(:lose?)
        hangman.game_over?

      end

      context "when the game is won or lost" do
        it "should print @secret_word" do
          allow(Hangman).to receive(:random_word).and_return("cat")

          allow(hangman).to receive(:lose?).and_return(false)
          allow(hangman).to receive(:win?).and_return(true)
          expect { hangman.game_over? }.to output(/cat/).to_stdout

          allow(hangman).to receive(:lose?).and_return(true)
          allow(hangman).to receive(:win?).and_return(false)
          expect { hangman.game_over? }.to output(/cat/).to_stdout
        end

        it "should return true" do
          allow(hangman).to receive(:lose?).and_return(false)
          allow(hangman).to receive(:win?).and_return(true)
          expect(hangman.game_over?).to eq(true)

          allow(hangman).to receive(:lose?).and_return(true)
          allow(hangman).to receive(:win?).and_return(false)
          expect(hangman.game_over?).to eq(true)
        end
      end

      context "when the game is not over" do
        it "should return false" do
          allow(hangman).to receive(:lose?).and_return(false)
          allow(hangman).to receive(:win?).and_return(false)
          expect(hangman.game_over?).to eq(false)
        end
      end
    end
  end

end
