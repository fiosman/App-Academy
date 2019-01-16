require 'rspec'
require 'enumerables1'

describe "Enumerables part 1" do
  let(:nums) { [1,2,3,4,5,5,4] }

  describe "get_evens" do
    let(:evens) { [2,4,4] }

    it "filters out odd numbers" do
      expect(get_evens(nums).none?(&:odd?)).to be(true)
    end

    it "leaves all the even numbers" do
      expect(get_evens(nums)).to eq(evens)
    end
  end

  context "doubling methods" do
    let(:doubles) { [2, 4, 6, 8, 10, 10, 8] }

    describe "calculate_doubles" do
      it "returns an array of doubles" do
        expect(calculate_doubles(nums)).to eq(doubles)
      end

      it "does NOT modify the original array" do
        check_array = nums.dup
        calculate_doubles(nums)
        expect(nums).to eq(check_array)
      end
    end

    describe "calculate_doubles!" do
      it "returns an array of doubles" do
        expect(calculate_doubles!(nums)).to eq(doubles)
      end

      it "does modify the original array" do
        calculate_doubles!(nums)
        expect(nums).to eq(doubles)
      end
    end
  end

  describe "array_sum_with_index" do
    it "returns the correct sum" do
      expect(array_sum_with_index(nums)).to eq(89)
    end

    it "returns 0 given and empty array" do
      expect(array_sum_with_index([])).to eq(0)
    end
  end

  describe "price_is_right" do
    it "picks the nearst number" do
      bids = [1,2,3,4,6,7]
      expect(price_is_right(bids, 5)).to eq(4)
    end

    it "doesn't go over the price" do
      bids = [1, 10]
      expect(price_is_right(bids, 9)).to eq(1)
    end
  end

  describe "at_least_n_factors" do
    it "returns the correct list of numbers" do
      expect(at_least_n_factors([1, 3, 10, 16], 5)).to eq([16])
    end
  end

  describe "ordered_vowel_words" do
    let(:words) { %w(word pale sleap word random boat pry) }

    it "returns words with no vowels" do
      expect(ordered_vowel_words(words)).to include("pry")
    end

    it "filters out words with out-or-order vowels" do
      ordered_words = %w(word pale word random pry)
      expect(ordered_vowel_words(words)).to eq(ordered_words)
    end
  end

  describe "products_except_me" do
    it "returns an empty array when given an empty array" do
      expect([]).to eq([])
    end

    it "calculates the correct products" do
      nums = [1, 2, 3, 4]
      prods = [24, 12, 8, 6]
      expect(products_except_me(nums)).to eq(prods)
    end
  end
end
