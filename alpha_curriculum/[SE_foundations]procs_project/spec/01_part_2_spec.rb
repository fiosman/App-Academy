require "part_2"

describe "PART 2" do
  describe "reverser" do
    it "should accept a string and a block as args" do
      expect { reverser("abcd") { |string| string.upcase } }.to_not raise_error
    end

    it "should return the result of the block when passed the string with it's characters reversed" do
      expect(reverser("abcd") { |string| string.upcase }).to eq("DCBA")
      expect(reverser("hello") { |string| string + "!!!" }).to eq("olleh!!!")
    end
  end

  describe "word_changer" do
    it "should accept a sentence string and a block as args" do
      expect { word_changer("goodbye moon") { |word| word.upcase + "!" } }.to_not raise_error
    end

    it "should return a new sentence where every word becomes the result of the block when passed the original word of the sentence" do
      expect(word_changer("goodbye moon") { |word| word.upcase + "!" }).to eq("GOODBYE! MOON!")
      expect(word_changer("Hello World") { |word| ".." + word.downcase + ".." }).to eq("..hello.. ..world..")
    end
  end

  describe "greater_proc_value" do
    it "should accept a number and two procs as args" do
      proc_1 = Proc.new { |n| n * 10 }
      proc_2 = Proc.new { |n| n * n }

      expect { greater_proc_value(3, proc_1, proc_2) }.to_not raise_error
    end

    it "should return the greater result of the two procs when each is passed the number" do
      times_10 = Proc.new { |n| n * 10 }
      square = Proc.new { |n| n * n }
      negate = Proc.new { |n| n * -1 }

      expect(greater_proc_value(3, times_10, square)).to eq(30)
      expect(greater_proc_value(12, times_10, square)).to eq(144)
      expect(greater_proc_value(-5, times_10, negate)).to eq(5)
    end
  end

  describe "and_selector" do
    it "should accept an array and two procs as args" do
      proc_1 = Proc.new { |n| n.even? }
      proc_2 = Proc.new { |n| n < 0 }

      expect { and_selector([-5, 0, -8, 8, -2], proc_1, proc_2) }.to_not raise_error
    end

    it "should return a new array containing elements of the original array that result in true when passed into both procs" do
      even = Proc.new { |n| n.even? }
      negative = Proc.new { |n| n < 0 }

      expect(and_selector([-5, 0, -8, 8, -2], even, negative)).to eq([-8, -2])
      expect(and_selector([5, 4, 10, 15], even, negative)).to eq([])
    end
  end

  describe "alternating_mapper" do
    it "should accept an array and two procs as args" do
      proc_1 = Proc.new { |n| n / 2.0 }
      proc_2 = Proc.new { |n| n * 1000 }

      expect { alternating_mapper([1,2,3,4,5], proc_1, proc_2) }.to_not raise_error
    end

    it "should return a new array where all of the elements at even indices are the results when those elements are passed into the first proc and all of the elements at odd indices are the results when those elements are passed into the second proc" do
      half = Proc.new { |n| n / 2.0 }
      times_thousand = Proc.new { |n| n * 1000 }
      expect(alternating_mapper([1,10,4,7,5], half, times_thousand)).to eq([0.5, 10000, 2.0, 7000, 2.5])
    end
  end
end
