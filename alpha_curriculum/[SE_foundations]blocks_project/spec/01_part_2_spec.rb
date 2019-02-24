require "part_2"

describe "PART 2" do
  describe "all_words_capitalized?" do
    it "should accept an array of words as an arg" do
      expect { all_words_capitalized?(["Hello", "World"]) }.to_not raise_error
    end

    context "when all words are properly capitalized (first letter of word uppercase, other letters lowercase)" do
      it "should return true" do
        expect(all_words_capitalized?(["Hello", "World"])).to eq(true)
        expect(all_words_capitalized?(["Follow", "The", "Yellow", "Brick", "Road"])).to eq(true)
      end
    end

    context "when at least one word is not capitalized" do
      it "should return false" do
        expect(all_words_capitalized?(["hello", "world"])).to eq(false)
        expect(all_words_capitalized?(["Hello", "WORLD"])).to eq(false)
        expect(all_words_capitalized?(["Follow", "the", "Yellow", "Brick", "Road"])).to eq(false)
      end
    end

    it "should use Array#all?" do
      array = ["Hello", "World"]
      expect(array).to receive(:all?).at_least(:once)
      all_words_capitalized?(array)
    end
  end

  describe "no_valid_url?" do
    it "should accept an array of urls as an arg" do
      urls = ["appacademy.io", "sennacy.com", "heyprogrammers.org"]
      expect { no_valid_url?(urls) }.to_not raise_error
    end

    context "when none of the urls end in '.com', '.net', '.io', or '.org'" do
      it "should return true" do
        expect(no_valid_url?(["appacademy.biz", "awebsite.me"])).to eq(true)
        expect(no_valid_url?(["computernetwork.co"])).to eq(true)

      end
    end

    context "when at least one of the urls end in '.com', '.net', '.io', or '.org'" do
      it "should return false" do
        expect(no_valid_url?(["appacademy.io", "sennacy.com", "heyprogrammers.org"])).to eq(false)
        expect(no_valid_url?(["appacademy.biz", "sennacy.com"])).to eq(false)
      end
    end

    it "should use Array#none?" do
      urls = ["appacademy.io", "sennacy.com", "heyprogrammers.org"]
      expect(urls).to receive(:none?).at_least(:once)
      no_valid_url?(urls)
    end
  end

  describe "any_passing_students?" do
    it "should accept an array of student hashes as an arg" do
      students = [
        { name: "Alvin", grades: [70, 50, 75] },
        { name: "Warlin", grades: [80, 99, 95] },
        { name: "Vlad", grades: [100] },
      ]

      expect { any_passing_students?(students) }.to_not raise_error
    end

    context "when at least one student has an average grade of 75 or higher" do
      it "should return true" do
        students_1 = [
          { name: "Alvin", grades: [70, 50, 75] },
          { name: "Warlin", grades: [80, 99, 95] },
          { name: "Vlad", grades: [100] },
        ]
        expect(any_passing_students?(students_1)).to eq(true)

        students_2 = [
          { name: "Alice", grades: [94, 96] },
          { name: "Bob", grades: [50, 60] }
        ]
        expect(any_passing_students?(students_2)).to eq(true)        
      end
    end

    context "when no student has an average grade of 75 or higher" do
      it "should return false" do
        students = [
          { name: "Alice", grades: [60, 68] },
          { name: "Bob", grades: [20, 100] }
        ]

        expect(any_passing_students?(students)).to eq(false)
      end
    end

    it "should use Array#any?" do
      students = [
        { name: "Alice", grades: [60, 68] },
        { name: "Bob", grades: [20, 100] }
      ]

      expect(students).to receive(:any?).at_least(:once)
      any_passing_students?(students)
    end
  end
end
