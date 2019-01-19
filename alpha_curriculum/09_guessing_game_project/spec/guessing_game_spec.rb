require "guessing_game"

# The code below suppresses stdout while rspec runs.
################################################################
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
################################################################

puts "\nNOTE: Once you complete all specs, run `ruby lib/play_guessing_game.rb` in your terminal!"

describe "GuessingGame" do
  let(:guessing_game) { GuessingGame.new(0, 100) }

  describe "#initialize" do
    it "should accept two numbers, min and max, as args" do
      guessing_game
    end

    it "should set @secret_num to a random number between min and max inclusive" do
      expect(guessing_game.instance_variable_get(:@secret_num)).to be_between(0, 100)
    end

    it "should call #rand" do
      allow(guessing_game).to receive(:rand).and_return(42)
      expect(guessing_game).to receive(:rand)
      guessing_game.send(:initialize, 0, 100)
    end

    it "should set @num_attempts to 0" do
      expect(guessing_game.instance_variable_get(:@num_attempts)).to eq(0)
    end

    it "should set @game_over to false" do
      expect(guessing_game.instance_variable_get(:@game_over)).to eq(false)
    end
  end

  describe "#num_attempts" do
    it "should get (return) @num_attempts" do
      expect(guessing_game.num_attempts).to be(guessing_game.instance_variable_get(:@num_attempts))
    end
  end

  describe "#game_over?" do
    it "should get (return) @game_over" do
      expect(guessing_game.game_over?).to be(guessing_game.instance_variable_get(:@game_over))
    end
  end

  describe "#check_num" do
    it "should accept a num as an arg" do
      guessing_game.check_num(50)
    end

    it "should increment @num_attempts" do
      guessing_game.check_num(50)
      expect(guessing_game.num_attempts).to eq(1)
      guessing_game.check_num(50)
      expect(guessing_game.num_attempts).to eq(2)
    end

    it "should set @game_over to true if the num is equal to @secret_num" do
      guessing_game.instance_variable_set(:@secret_num, 42)

      guessing_game.check_num(50)
      expect(guessing_game.game_over?).to eq(false)

      guessing_game.check_num(42)
      expect(guessing_game.game_over?).to eq(true)
    end

    context "when the num is equal to @secret_num" do
      it "should print 'you win'" do
        guessing_game.instance_variable_set(:@secret_num, 42)
        expect { guessing_game.check_num(42) }.to output(/win/).to_stdout
      end
    end

    context "when the num is greater than @secret_num" do
      it "it should print 'too big'" do
        guessing_game.instance_variable_set(:@secret_num, 42)
        expect { guessing_game.check_num(50) }.to output(/big/).to_stdout
      end
    end

    context "when the num is less than @secret_num" do
      it "it should print 'too small'" do
        guessing_game.instance_variable_set(:@secret_num, 42)
        expect { guessing_game.check_num(30) }.to output(/small/).to_stdout
      end
    end
  end

  describe "ask_user" do
    it "should print 'enter a number'" do
      allow(guessing_game).to receive(:gets).and_return("50\n")
      expect { guessing_game.ask_user }.to output(/number/).to_stdout
    end

    it "should call #gets to get input from the user" do
      allow(guessing_game).to receive(:gets).and_return("50\n")
      expect(guessing_game).to receive(:gets)
      guessing_game.ask_user
    end

    it "should call String#chomp on the input received from the user" do
      num_input = double("50\n", :chomp => "50")
      allow(guessing_game).to receive(:gets).and_return(num_input)
      expect(num_input).to receive(:chomp)
      guessing_game.ask_user
    end

    it "should call String#to_i on the input string to convert it into an integer number" do
      chomped_input = double("50", :to_i => 50)
      expect(chomped_input).to receive(:to_i)
      num_input = double("50\n", :chomp => chomped_input)
      allow(guessing_game).to receive(:gets).and_return(num_input)
      guessing_game.ask_user
    end

    it "should call GuessingGame#check_num with the user's number" do
      allow(guessing_game).to receive(:gets).and_return("50\n")
      expect(guessing_game).to receive(:check_num).with(50)
      guessing_game.ask_user

      allow(guessing_game).to receive(:gets).and_return("7\n")
      expect(guessing_game).to receive(:check_num).with(7)
      guessing_game.ask_user
    end
  end
end
