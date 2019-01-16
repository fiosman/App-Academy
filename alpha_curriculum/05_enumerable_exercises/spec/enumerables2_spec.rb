require 'rspec'
require 'enumerables2'

describe "Enumerables part 2" do
  describe "array_sum" do
    it "returns 0 when passed an empty array" do
      expect(array_sum([])).to eq(0)
    end

    it "correctly sums an array" do
      expect(array_sum([1, 2, 3, -2])).to eq(4)
    end
  end

  describe "in_all_strings?" do
    subject(:long_strings) { ["Hi there", "there it goes", "there there"]}

    it "returns true when substring is contained in each long string" do
      expect(in_all_strings?(long_strings, "there")).to be(true)
    end

    it "returns false when substring is not contained in a long string" do
      expect(in_all_strings?(long_strings, "it")).to be(false)
    end
  end

  describe "non_unique_letters" do
    let(:string) { "aab ca dc ee f h f" }
    let(:non_uniques) { ['a', 'c', 'e', 'f'] }

    it "doesn't return unique letters" do
      expect(non_unique_letters(string)).not_to include('b')
    end

    it "returns non-unique letters" do
      expect(non_unique_letters(string)).to eq(non_uniques)
    end
  end

  describe "longest_two_words" do
    let(:string) { "this is a string with sooooooo many words" }

    it "returns two words" do
      expect(longest_two_words(string).length).to be(2)
    end

    it "returns the longest words" do
      two_words = ["sooooooo", "string"]
      expect(longest_two_words(string).sort).to eq(two_words)
    end
  end

  describe "missing_letters" do
    let(:string) { 'bcdefghijklmnopstuvxyz' }
    let(:missing) { %w(a q r w) }

    it "doesn't return any letters in the string" do
      expect(missing_letters(string) - missing).to be_empty
    end

    it "returns all the missing letters" do
      expect(missing_letters(string).sort).to eq(missing)
    end
  end

  describe "no_repeat_years" do
    it "does not return repeat years" do
      repeat_years = [1971, 1977, 1979]
      expect(repeat_years & no_repeat_years(1970, 1980)).to be_empty
    end

    it "returns all the non-repeat years" do
      non_repeat_years = [1970, 1972, 1973, 1974, 1975, 1976, 1978, 1980]
      expect(no_repeat_years(1970, 1980)).to eq(non_repeat_years)
    end
  end

  describe "one_week_wonders" do
    subject(:songs) { %w(la di da la la di do da di di) }
    it "returns all the one-week-wonders" do
      expect(one_week_wonders(songs).sort).to eq(['da', 'do'])
    end

    it "recognizes one-week-wonders that occur multiple times" do
      expect(one_week_wonders(songs).sort).to include('da')
    end

    it "doesn't return non-one-week-wonders" do
      expect(one_week_wonders(songs).sort).not_to include('la')
    end
  end

  describe "for_cs_sake" do
    it "finds the correct word" do
      expect(for_cs_sake("toe sticker ack lock box")).to eq('ack')
    end

    it "ignores punctuation" do
      expect(for_cs_sake("acc!?!?...,, lock")).to eq('acc')
    end
  end

  describe "repeated_number_ranges" do
    it "finds repeated number ranges" do
      nums = [1, 2, 3, 3, 4, 4, 4, 3, 3]
      ranges = [[2, 3], [4, 6], [7, 8]]
      expect(repeated_number_ranges(nums)).to eq(ranges)
    end

    it "works when the first number is repeated" do
      nums = [1, 1, 2, 3]
      ranges = [[0, 1]]
      expect(repeated_number_ranges(nums)).to eq(ranges)
    end

    it "works when there are no repeated numbers" do
      nums = [1, 2, 3, 4]
      ranges = []
      expect(repeated_number_ranges(nums)).to eq(ranges)
    end
  end
end
