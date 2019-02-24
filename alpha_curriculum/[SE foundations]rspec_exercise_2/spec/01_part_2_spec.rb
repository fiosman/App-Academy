require "part_2"

describe "Part 2:" do
  describe "palindrome?" do
    it "should accept a string as an arg" do
      expect { palindrome?("tot") }.to_not raise_error
    end

    context "when the string is the same forwards and backwards" do
      it "should return true" do
        expect(palindrome?("tot")).to eq(true)
        expect(palindrome?("racecar")).to eq(true)
        expect(palindrome?("madam")).to eq(true)
        expect(palindrome?("aa")).to eq(true)
        expect(palindrome?("a")).to eq(true)
      end
    end

    context "when the string is not the same forwards and backwards" do
      it "should return false" do
        expect(palindrome?("cat")).to eq(false)
        expect(palindrome?("greek")).to eq(false)
        expect(palindrome?("xabcx")).to eq(false)
      end
    end

    it "should not use String#reverse" do
      expect_any_instance_of(String).to_not receive(:reverse)
      palindrome?("tot")
    end
  end

  describe "substrings" do
    it "should accept a string as an arg" do
      expect { substrings("jump") }.to_not raise_error
    end

    it "should return an array containing all substrings of the given string" do
      expect(substrings("jump")).to match_array ["j", "ju", "jum", "jump", "u", "um", "ump", "m", "mp", "p"]
      expect(substrings("abc")).to match_array ["a", "ab", "abc", "b", "bc", "c"]
      expect(substrings("x")).to match_array ["x"]
    end
  end

  describe "palindrome_substrings" do
    it "should accept a string as an arg" do
      expect { palindrome_substrings("abracadabra") }.to_not raise_error
    end

    it "should return an array containing all substrings that are palindromes and longer than 1 character" do
      expect(palindrome_substrings("abracadabra")).to match_array ["aca", "ada"]
      expect(palindrome_substrings("madam")).to match_array ["madam", "ada"]
      expect(palindrome_substrings("taco")).to match_array []
    end

    it "should call your previous 'palindrome?' method" do
      expect(self).to receive(:palindrome?).at_least(:once)
      palindrome_substrings("madam")
    end

    it "should call your previous 'substrings' method" do
      allow(self).to receive(:substrings).and_return(["a", "ab", "b"])
      expect(self).to receive(:substrings).at_least(:once)
      palindrome_substrings("ab")
    end
  end
end
