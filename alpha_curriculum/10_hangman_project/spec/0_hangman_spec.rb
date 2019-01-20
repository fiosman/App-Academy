require "hangman"

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

puts "\nNOTE: Once you complete all specs, run `ruby lib/play_hangman.rb` in your terminal!"

describe "Hangman" do
  let(:hangman) { Hangman.new }

  describe "::DICTIONARY" do
    it "should be an array of words" do
      expect(Hangman::DICTIONARY).to be_an(Array)
    end
  end

  describe "PART 1" do
    describe "::random_word" do
      it "should return a random word in the dictionary" do
        expect(Hangman::DICTIONARY).to include(Hangman.random_word)
      end

      it "should call Array#sample" do
        expect(Hangman::DICTIONARY).to receive(:sample)
        Hangman.random_word
      end
    end

    describe "#initialize" do
      it "should call Hangman::random_word" do
        allow(Hangman).to receive(:random_word).and_return("dog")
        expect(Hangman).to receive(:random_word)
        hangman
      end

      it "should set @secret_word with the random word " do
        allow(Hangman).to receive(:random_word).and_return("dog")
        expect(hangman.instance_variable_get(:@secret_word)).to eq("dog")
      end

      it "should set @guess_word to be an array with the same length as the @secret_word containing '_' as each element" do
        allow(Hangman).to receive(:random_word).and_return("dog")
        expect(Hangman.new.instance_variable_get(:@guess_word)).to eq(Array.new(3, "_"))

        allow(Hangman).to receive(:random_word).and_return("bootcamp")
        expect(Hangman.new.instance_variable_get(:@guess_word)).to eq(Array.new(8, "_"))
      end

      it "should set @attempted_chars to be an empty array" do
        expect(hangman.instance_variable_get(:@attempted_chars)).to eq([])
      end

      it "should set @remaining_incorrect_guesses to 5" do
        expect(hangman.instance_variable_get(:@remaining_incorrect_guesses)).to eq(5)
      end
    end

    describe "#guess_word" do
      it "should get (return) @guess_word" do
        expect(hangman.guess_word).to be(hangman.instance_variable_get(:@guess_word))
      end
    end

    describe "#attempted_chars" do
      it "should get (return) @attempted_chars" do
        expect(hangman.attempted_chars).to be(hangman.instance_variable_get(:@attempted_chars))
      end
    end

    describe "#remaining_incorrect_guesses" do
      it "should get (return) @remaining_incorrect_guesses" do
        expect(hangman.remaining_incorrect_guesses).to be(hangman.instance_variable_get(:@remaining_incorrect_guesses))
      end
    end

    describe "#already_attempted?" do
      it "should accept a char as an arg" do
        hangman.already_attempted?("b")
      end

      context "when the given char is in @attempted_chars" do
        it "should return true" do
          hangman.instance_variable_set(:@attempted_chars, ["b"])
          expect(hangman.already_attempted?("b")).to eq(true)
        end
      end

      context "when the given char is not in @attempted_chars" do
        it "should return false" do
          hangman.instance_variable_set(:@attempted_chars, ["b"])
          expect(hangman.already_attempted?("c")).to eq(false)
        end
      end
    end

    describe "#get_matching_indices" do
      it "should accept a single char as an arg" do
        hangman.get_matching_indices("o")
      end

      it "should return an array containing all indices of @secret_word where the char can be found" do
        allow(Hangman).to receive(:random_word).and_return("bootcamp")
        expect(hangman.get_matching_indices("o")).to eq([1, 2])
        expect(hangman.get_matching_indices("c")).to eq([4])
      end

      context "when the char is not found in @secret_word" do
        it "should return an empty array" do
          allow(Hangman).to receive(:random_word).and_return("bootcamp")
          expect(hangman.get_matching_indices("x")).to eq([])
        end
      end
    end

    describe "#fill_indices" do
      it "should accept a char and an array of indices" do
        allow(Hangman).to receive(:random_word).and_return("bootcamp")
        hangman.fill_indices("o", [1, 2])
      end

      it "should set the given indices of @guess_word to the given char" do
        allow(Hangman).to receive(:random_word).and_return("bootcamp")
        hangman.fill_indices("o", [1, 2])
        expect(hangman.guess_word).to eq(["_", "o", "o", "_", "_", "_", "_", "_"])
      end
    end
  end
end
