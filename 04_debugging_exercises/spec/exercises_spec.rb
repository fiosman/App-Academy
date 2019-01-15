require "rspec"
require "exercises"

describe "titleize" do
  it "capitalizes a word" do
    expect(titleize("jaws")).to eq("Jaws")
  end

  it "capitalizes every word (aka title case)" do
    expect(titleize("david copperfield")).to eq("David Copperfield")
  end

  it "doesn't capitalize 'little words' in a title" do
    expect(titleize("war and peace")).to eq("War and Peace")
  end

  it "does capitalize 'little words' at the start of a title" do
    expect(titleize("the bridge over the river kwai")).to eq("The Bridge over the River Kwai")
  end
end

describe 'largest_prime_factor' do
  it 'returns 2 for 2' do
    expect(largest_prime_factor(2)).to eq(2)
  end

  it 'returns 5 for 10' do
    expect(largest_prime_factor(10)).to eq(5)
  end
  it 'can detect larger factors' do
    expect(largest_prime_factor(152)).to eq(19)
  end
  it 'can detect even larger factors' do
    expect(largest_prime_factor(2098)).to eq(1049)
  end

  it "returns original number if it is prime" do
    expect(largest_prime_factor(13)).to eq(13)
  end

  it 'returns nil for zero and one' do
    expect(largest_prime_factor(0)).to be_nil
    expect(largest_prime_factor(1)).to be_nil
  end
end

describe "symmetric_substrings" do
  it "handles a simple example" do
    expect(symmetric_substrings("aba")).to match_array(["aba"])
  end

  it "handles two substrings" do
    expect(symmetric_substrings("aba1cdc")).to match_array(["aba", "cdc"])
  end

  it "handles nested substrings" do
    expect(symmetric_substrings("xabax")).to match_array(["aba", "xabax"])
  end
end
