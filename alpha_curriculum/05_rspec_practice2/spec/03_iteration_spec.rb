require "rspec"
require "03_iteration"

describe "#factors" do
  it "returns factors of 10 in order" do
    expect(factors(10)).to eq([1, 2, 5, 10])
  end

  it "returns just two factors for primes" do
    expect(factors(13)).to eq([1, 13])
  end
end

describe "#subwords" do
  it "can find a simple word" do
    words = subwords("asdfcatqwer", ["cat", "car"])
    expect(words).to eq(["cat"])
  end

  it "doesn't find spurious words" do
    words = subwords("batcabtarbrat", ["cat", "car"])
    expect(words).to be_empty
  end

  it "can find words within words" do
  #note that the method should NOT return duplicate words
    dictionary = ["bears", "ear", "a", "army"]
    words = subwords("erbearsweatmyajs", dictionary)

    expect(words).to eq(["bears", "ear", "a"])
  end
end

describe "#doubler" do
  let(:array) { [1, 2, 3] }

  it "doubles the elements of the array" do
    expect(doubler(array)).to eq([2, 4, 6])
  end

  it "does not modify the original array" do
    duped_array = array.dup

    doubler(array)

    expect(array).to eq(duped_array)
  end
end

describe Array do
  describe "#bubble_sort!" do
    let(:array) { [1, 2, 3, 4, 5].shuffle }

    it "works with an empty array" do
      expect([].bubble_sort!).to eq([])
    end

    it "works with an array of one item" do
      expect([1].bubble_sort!).to eq([1])
    end

    it "sorts numbers" do
      expect(array.bubble_sort!).to eq(array.sort)
    end

    it "modifies the original array" do
      duped_array = array.dup
      array.bubble_sort!
      expect(duped_array).not_to eq(array)
    end

    it "will use a block if given" do
      sorted = array.bubble_sort! do |num1, num2|
        # order numbers based on descending sort of their squares
        num2**2 <=> num1**2
      end

      expect(sorted).to eq([5, 4, 3, 2, 1])
    end
  end

  describe "#bubble_sort" do
    let(:array) { [1, 2, 3, 4, 5].shuffle }

    it "delegates to #bubble_sort!" do
      expect_any_instance_of(Array).to receive(:bubble_sort!)

      array.bubble_sort
    end

    it "does not modify the original array" do
      duped_array = array.dup
      array.bubble_sort
      expect(duped_array).to eq(array)
    end
  end

  describe "#my_each" do
    it "calls the block passed to it" do
      expect do |block|
        ["test array"].my_each(&block)
      end.to yield_control.once
    end

    it "yields each element to the block" do
      expect do |block|
        ["el1", "el2"].my_each(&block)
      end.to yield_successive_args("el1", "el2")
    end

    it "does NOT call the built-in #each method" do
      original_array = ["original array"]
      expect(original_array).not_to receive(:each)
      original_array.my_each {}
    end

    it "is chainable and returns the original array" do
      original_array = ["original array"]
      expect(original_array.my_each {}).to eq(original_array)
    end
  end

  describe "#my_map" do
    it "calls the block passed to it" do
      expect do |block|
        ["test array"].my_map(&block)
      end.to yield_control.once
    end

    it "yields each element to the block" do
      expect do |block|
        ["el1", "el2"].my_map(&block)
      end.to yield_successive_args("el1", "el2")
    end

    it "runs the block for each element" do
      expect([1, 2, 3].my_map { |el| el * el }).to eq([1, 4, 9])
      expect([-1, 0, 1].my_map { |el| el.odd? }).to eq([true, false, true])
    end

    it "does NOT call the built in built-in #map method" do
      original_array = ["original array"]
      expect(original_array).not_to receive(:map)
      original_array.my_map {}
    end

    it "is chainable and returns a new array" do
      original_array = ["original array"]
      expect(original_array.my_map {}).not_to eq(original_array)
    end
  end

  describe "#my_select" do
    it "calls the block passed to it" do
      expect do |block|
        ["test element"].my_select(&block)
      end.to yield_control
    end

    it "yields each element to the block" do
      test_array = ["el1", "el2", "el3"]
      expect do |block|
        test_array.my_select(&block)
      end.to yield_successive_args("el1", "el2", "el3")
    end

    it "returns an array of filtered down items" do
      test_array = [1, 2, 3, 4, 5]
      expect(test_array.my_select(&:odd?)).to eq([1, 3, 5])
      expect(test_array.my_select { |el| el < 3 }).to eq([1, 2])
    end

    it "does NOT call the built-in #select method" do
      test_array = ["el1", "el2", "el3"]
      expect(test_array).not_to receive(:select)
      test_array.my_select {}
    end
  end

  describe "#my_inject" do
    it "calls the block passed to it" do
      expect do |block|
        [1, 2].my_inject(&block)
      end.to yield_control.once
    end

    it "makes the first element the accumulator if no default is given" do
      expect do |block|
        ["el1", "el2", "el3"].my_inject(&block)
      end.to yield_successive_args(["el1", "el2"], [nil, "el3"])
    end

    it "yields the accumulator and each element to the block" do
      expect do |block|
        [1, 2, 3].my_inject(&block)
      end.to yield_successive_args([1, 2], [nil, 3])
    end

    it "does NOT call the built-in #inject method" do
      original_array = ["original array"]
      expect(original_array).not_to receive(:inject)
      original_array.my_inject {}
    end

    it "is chainable and returns a new array" do
      original_array = ["original array"]
      expect(original_array.my_inject {}).not_to eq(original_array)
    end
  end
end

describe "#concatenate" do
  let(:strings) { ["These ", "are ", "my ", "strings"] }

  it "returns the concatenation of the strings passed in" do
    expect(concatenate(strings)).to eq("These are my strings")
  end

  it "does not modify the original strings" do
    concatenate(strings)

    expect(strings).to eq(["These ", "are ", "my ", "strings"])
  end

  it "uses the Array#inject method" do
    expect(strings).to receive(:inject)

    concatenate(strings)
  end
end
