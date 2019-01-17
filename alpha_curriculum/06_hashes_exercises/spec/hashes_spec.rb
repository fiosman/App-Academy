require 'rspec'
require 'hashes'

describe "Hashes" do
  describe "word_lengths" do
    it "hashes words to their lengths" do
      str = "go three go two"
      hash = { 'go' => 2, 'three' => 5, 'two' => 3 }
      expect(word_lengths(str)).to eq(hash)
    end
  end

  describe "greatest_key_by_val" do
    it "returns the maximum value" do
      hash = { 'go' => 2, 'three' => 5, 'two' => 3 }
      expect(greatest_key_by_val(hash)).to eq('three')
    end

    it "compares by value, not key" do
      hash = { 10 => 1, 2 => 5 }
      expect(greatest_key_by_val(hash)).to eq(2)
    end
  end

  describe "update_inventory" do
    let(:old) { { rubies: 10, diamonds: 5} }

    it "updates old values" do
      new = { rubies: 20, diamonds: 5}
      expect(update_inventory(old, new)).to eq(new)
    end

    it "adds new key-value pairs" do
      new = { rubies: 10, diamonds: 5, emeralds: 2}
      merged = { rubies: 10, diamonds: 5, emeralds: 2}
      expect(update_inventory(old, new)).to eq(new)
    end

    it "keeps old key-value pairs that haven't been updated" do
      new = { rubies: 10}
      expect(update_inventory(old, new)).to eq(old)
    end

    it "mutates older" do
      new = { rubies: 20, diamonds: 5}
      update_inventory(old, new)
      expect(old).to eq(new)
    end

    it "doesn't mutate newer" do
      new = { rubies: 20 }
      update_inventory(old, new)
      expect(new).to eq({ rubies: 20 })
    end
  end

  describe "letter_counts" do
    it "counts the frequency of letters in a word" do
      word = "aabcaddq"
      hash = { 'a' => 3, 'b' => 1, 'c' => 1, 'd' => 2, 'q' => 1 }
      expect(letter_counts(word)).to eq(hash)
    end
  end

  describe "my_uniq" do
    let(:arr) { [1, 2, 3, 1, 1, 2] }

    it "removes duplicates" do
      expect(my_uniq(arr)).to eq([1, 2, 3])
    end

    it "doesn't call Array#uniq" do
      expect(arr).not_to receive(:uniq)
      my_uniq(arr)
    end
  end

  describe "evens_and_odds" do
    it "counts even and odd numbers" do
      arr = [1,2,3,1,5]
      expect(evens_and_odds(arr)).to eq({ even: 1, odd: 4 })
    end
  end

  describe "most_common_vowel" do
    it "returns the most common vowel" do
      str = "eieeoaa"
      expect(most_common_vowel(str)).to eq("e")
    end

    it "defaults to alphabetical order in case of tie" do
      str = "eeiaoa"
      expect(most_common_vowel(str)).to eq("a")
    end
  end

  describe "fall_and_winter_birthdays" do
    it "filters out students with birthdays in the second half of the year" do
      students = {
        "Asher" => 6,
        "Bertie" => 11,
        "Dottie" => 8,
        "Warren" => 9
      }
      combinations = [
        ["Bertie", "Dottie"],
        ["Bertie", "Warren"],
        ["Dottie", "Warren"]
      ]
      expect(fall_and_winter_birthdays(students).sort).to eq(combinations)
    end
  end

  describe "biodiversity_index" do
    it "calculates the correct result" do
      expect(biodiversity_index(["cat", "cat", "cat"])).to eq(1)
      expect(biodiversity_index(["cat", "leopard-spotted ferret", "dog"])).to eq(9)
    end
  end

  describe "can_tweak_sign?" do
    it "returns true when vandalized_sign is an anagram of a substring of normal_sign" do
      expect(can_tweak_sign?("We're having a yellow ferret sale for a good cause over at the
      pet shop!", "Leopard ferrets forever yo")).to be(true)
    end

    it "returns false when vandalized_sign is NOT an anagram of a substring of normal_sign" do
      expect(can_tweak_sign?("abcd", "aa")).to be(false)
    end
  end
end
