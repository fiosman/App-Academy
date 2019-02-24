require "part_1"

describe "PART 1" do
  describe "select_even_nums" do
    it "should accept an array of numbers as an arg" do
      select_even_nums([7, 3, 2, 5, 12])
    end

    it "should return an array containing only the even numbers" do
      expect(select_even_nums([7, 3, 2, 5, 12])).to eq([2, 12])
      expect(select_even_nums([20, 40, 31])).to eq([20, 40])
      expect(select_even_nums([1, 2017])).to eq([])
    end

    it "should use Array#select" do
      array = [7, 3, 2, 5, 12]
      expect(array).to receive(:select).at_least(:once)
      select_even_nums(array)
    end
  end

  describe "reject_puppies" do
    it "should accept an array of dog hashes as an arg" do
      dogs = [
        {"name"=>"Fido", "age"=>3},
        {"name"=>"Spot", "age"=>2},
        {"name"=>"Rex", "age"=>5},
        {"name"=>"Gizmo", "age"=>1}
      ]

      expect{ reject_puppies(dogs) }.to_not raise_error
    end

    it "should return an array containing the dogs that are older than 2 years" do
      dogs = [
        {"name"=>"Fido", "age"=>3},
        {"name"=>"Spot", "age"=>2},
        {"name"=>"Rex", "age"=>5},
        {"name"=>"Gizmo", "age"=>1}
      ]

      expect(reject_puppies(dogs)).to eq([{"name"=>"Fido", "age"=> 3}, {"name"=>"Rex", "age"=>5}])
    end

    it "should use Array#reject" do
      dogs = [
        {"name"=>"Fido", "age"=>3},
        {"name"=>"Spot", "age"=>2},
        {"name"=>"Rex", "age"=>5},
        {"name"=>"Gizmo", "age"=>1}
      ]

      expect(dogs).to receive(:reject).at_least(:once)
      reject_puppies(dogs)
    end
  end

  describe "count_positive_subarrays" do
    it "should accept a 2D array as an arg" do
      array = [
        [-2, 5],
        [1, -9, 1],
        [4, 7]
      ]

      expect { count_positive_subarrays(array) }.to_not raise_error
    end

    it "should return the number of subarrays whose elements sum to a positive quantity" do
      array_1 = [
        [-2, 5],
        [1, -9, 1],
        [4, 7]
      ]
      expect(count_positive_subarrays(array_1)).to eq(2)

      array_2 = [
        [4],
        [-20, 1, 3],
        [4, -5],
        [-1000, 1000, -1, 1]
      ]
      expect(count_positive_subarrays(array_2)).to eq(1)
    end

    it "should use Array#count" do
      array = [
        [-2, 5],
        [1, -9, 1],
        [4, 7]
      ]

      expect(array).to receive(:count).at_least(:once)
      count_positive_subarrays(array)
    end
  end

  describe "aba_translate" do
    it "should accept a word string as an arg" do
      expect { aba_translate("cats") }.to_not raise_error
    end

    it "should transform the word by putting a 'b' after every vowel and adding that same vowel" do
      expect(aba_translate("cats")).to eq("cabats")
      expect(aba_translate("dog")).to eq("dobog")
      expect(aba_translate("kite")).to eq("kibitebe")
      expect(aba_translate("afrika")).to eq("abafribikaba")
      expect(aba_translate("fly")).to eq("fly")
    end
  end

  describe "aba_array" do
    it "should accept an array of words as an arg" do
      expect { aba_array(["cat", "dog", "butterfly"]) }.to_not raise_error
    end

    it "should return a new array where every word has been 'aba translated'" do
      expect(aba_array(["cat", "dog", "butterfly"])).to eq(["cabat", "dobog", "bubutteberfly"])
      expect(aba_array(["fly", "kite"])).to eq(["fly", "kibitebe"])
    end

    it "should use Array#map" do
      array = ["cat", "dog", "butterfly"]
      expect(array).to receive(:map).at_least(:once)
      aba_array(array)
    end

    it "should use your previous aba_translate method" do
      expect(self).to receive(:aba_translate).at_least(:once)
      aba_array(["cat", "dog", "butterfly"])
    end
  end
end
