# # Topics
#
# * blocks
# * closures
# * yield
# * loops

require "00_silly_blocks"

describe "some silly block functions" do
  describe "reverser" do
    it "reverses the string returned by the default block" do
      result = reverser do
        "hello"
      end

      expect(result).to eq("olleh")
    end

    it "reverses each word in the string returned by the default block" do
      result = reverser do
        "hello dolly"
      end

      expect(result).to eq("olleh yllod")
    end
  end

  describe "adder" do
    it "adds one to the value returned by the default block" do
      expect(adder { 5 }).to eq(6)
    end

    it "adds 3 to the value returned by the default block" do
      expect(adder(3) { 5 }).to eq(8)
    end
  end

  describe "repeater" do
    it "executes the default block" do
      block_was_executed = false

      repeater { block_was_executed = true }

      expect(block_was_executed).to be_truthy
    end

    it "executes the default block 3 times" do
      n = 0

      repeater(3) { n += 1 }

      expect(n).to eq(3)
    end

    it "executes the default block 10 times" do
      n = 0

      repeater(10) { n += 1 }

      expect(n).to eq(10)
    end
  end
end
