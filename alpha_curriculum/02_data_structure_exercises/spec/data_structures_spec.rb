require 'data_structures'

describe "range" do
  it "gets the range of an array of numbers" do
    expect(range([-1, 5, 0])).to eq(6)
  end

  it "correctly returns a range of 0" do
    expect(range([0, 0])).to eq(0)
  end
end

describe "in_order?" do
  it "returns false for letters that are out of order" do
    expect(in_order?(["a", "z", "c"])).to be false
  end

  it "returns true for numbers that are in order" do
    expect(in_order?([0, 1, 2])).to be true
  end
end

describe "num_vowels" do
  it "counts both capital and lowercase vowels" do
    expect(num_vowels("AEiouz")).to eq(5)
  end

  it "returns 0 if there are no vowels" do
    expect(num_vowels("ghf")).to eq(0)
  end
end

describe "devowel" do
  it "removes all vowels from a string" do
    expect(devowel("I have vowels")).to eq(" hv vwls")
  end

  it "does not change the string if there are no vowels" do
    expect(devowel("ghf")).to eq("ghf")
  end
end

describe "descending_digits" do
  it "returns an array of the digits in descending order" do
    expect(descending_digits(4291)).to eq(["9", "4", "2", "1"])
  end

  it "returns an array of a single digit" do
    expect(descending_digits(0)).to eq(["0"])
  end
end

describe "repeating_letters?" do
  it "returns true for lowercase and capital letters that are the same" do
    expect(repeating_letters?("aA")).to be true
  end

  it "returns false when there are no repeating letters" do
    expect(repeating_letters?("abcd")).to be false
  end
end

describe "to_phone_number" do
  it "returns a correctly formatter phone number string" do
    expect(to_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])).to eq("(123) 456-7890")
  end
end

describe "str_range" do
  it "returns the correct range for numbers out of order" do
    expect(str_range("4,1,8")).to eq(7)
  end

  it "returns 0 when the range is 0" do
    expect(str_range("0,0")).to eq(0)
  end
end

describe "my_rotate" do
  let(:rotated) { ["a", "b", "c", "d"] }
  it "rotates by 1 when no offset is specified" do
    expect(my_rotate(rotated)).to eq(["b", "c", "d", "a"])
  end

  it "rotates by a positive offset" do
    expect(my_rotate(rotated, 2)).to eq(["c", "d", "a", "b"])
  end

  it "rotates by a negative offset" do
    expect(my_rotate(rotated, -3)).to eq(["b", "c", "d", "a"])
  end

  it "correctly rotates for larger offsets" do
    expect(my_rotate(rotated, 15)).to eq(["d", "a", "b", "c"])
  end
end
