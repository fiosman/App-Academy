require 'rspec'
require 'control_flow'

describe "Control-Flow" do
  describe "destructive_uppercase" do
    it "returns the string with lowercase chars removed" do
      expect(destructive_uppercase("aBcD")).to eq("BD")
    end
  end

  describe "middle_substring" do
    it "returns the middle character of a string if the string length is odd" do
      expect(middle_substring("abcde")).to eq("c")
    end

    it "returns the middle two characters if the string length is even" do
      expect(middle_substring("abcdef")).to eq("cd")
    end
  end

  describe "num_vowels" do
    it "returns the number of vowels in a string" do
      expect(num_vowels("abcdef")).to eq(2)
      expect(num_vowels("ioul")).to eq(3)
    end
  end

  describe "factorial" do
    it "correctly calculates 1!" do
      expect(factorial(1)).to eq(1)
    end

    it "correctly calculates larger factorials" do
      expect(factorial(3)).to eq(6)
      expect(factorial(5)).to eq(120)
    end
  end

  describe "my_join" do
    arr = ['a', 'b', 'c']

    it "joins with the specified seperator" do
      expect(my_join(arr, 'X')).to eq('aXbXc')
    end

    it "defaults to an empty string for the seperator" do
      expect(my_join(arr)).to eq('abc')
    end

    it "returns an empty string when arr is empty" do
      expect(my_join([], 'X')).to eq('')
    end
  end

  describe "weirdcase" do
    it "converts str to weirdcase regardless of the original case" do
      w = "aBcD"
      expect(weirdcase("aBcD")).to eq(w)
      expect(weirdcase("ABCD")).to eq(w)
      expect(weirdcase("abCD")).to eq(w)
      expect(weirdcase("ABcd")).to eq(w)
    end
  end

  describe "reverse_five" do
    it "reverses all words of five or more characters" do
      str = "Hi there this is a string"
      rev = "Hi ereht this is a gnirts"
      expect(reverse_five(str)).to eq(rev)
      expect(reverse_five(rev)).to eq(str)
    end
  end

  describe "fizz_buzz" do
    it "words for 15" do
      fb_result = [
        1, 2, "fizz", 4, "buzz",
        "fizz", 7, 8, "fizz", "buzz",
        11, "fizz", 13, 14, "fizzbuzz"
      ]
      expect(fizzbuzz(15)).to eq(fb_result)
    end
  end

  describe "my_reverse" do
    it "reverses arrays" do
      expect(my_reverse([1, 2, 3])).to eq([3, 2, 1])
    end
  end

  describe "prime?" do
    it "returns true when num is prime" do
      expect(prime?(2)).to be(true)
      expect(prime?(5)).to be(true)
      expect(prime?(29)).to be(true)
    end

    it "returns false when num is not prime" do
      expect(prime?(4)).to be(false)
      expect(prime?(12)).to be(false)
      expect(prime?(27)).to be(false)
    end

    it "knows 1 is not prime" do
      expect(prime?(1)).to be(false)
    end
  end

  describe "factors" do
    it "lists all the factors of num" do
      expect(factors(5)).to eq([1, 5])
      expect(factors(12)).to eq([1, 2, 3, 4, 6, 12])
    end
  end

  describe "prime_factors" do
    it "returns only prime factors" do
      expect(prime_factors(12)).to eq([2, 3])
      expect(prime_factors(5)).to eq([5])
    end
  end

  describe "num_prime_factors" do
    it "calculates the number of prime factors of num" do
      expect(num_prime_factors(12)).to eq(2)
      expect(num_prime_factors(5)).to eq(1)
    end
  end

  describe "oddball" do
    it "returns the one ODD integer" do
      expect(oddball([1, 2, 4])).to eq(1)
    end

    it "returns the one EVEN integer" do
      expect(oddball([1, 2, 3])).to eq(2)
    end
  end
end
