require "Player"

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

describe "Player" do
  let (:player) { Player.new }
  describe "PART 3" do
    describe "#get_move" do
      it "should print 'enter a position with coordinates separated with a space like `4 7`'" do
        input = double("4 7\n", :chomp=>"4 7")
        allow(player).to receive(:gets).and_return(input)

        expect { player.get_move }.to output(/enter a position/).to_stdout
      end

      it "it should call gets.chomp to get input from the user" do
        input = double("4 7\n", :chomp=>"4 7")
        allow(player).to receive(:gets).and_return(input)

        expect(input).to receive(:chomp)
        expect(player).to receive(:gets)
        player.get_move
      end

      it "should return an array containing the player's two input numbers as integers" do
        input_1 = double("4 7\n", :chomp=>"4 7")
        allow(player).to receive(:gets).and_return(input_1)
        expect(player.get_move).to eq([4, 7])

        input_2 = double("1 0\n", :chomp=>"1 0")
        allow(player).to receive(:gets).and_return(input_2)
        expect(player.get_move).to eq([1, 0])
      end
    end
  end
end
