require "letter_count"

describe "letter_count" do
    it "should return the number of times the char appears in the string" do
        expect(letter_count("apple", "p")).to eq(2)
        expect(letter_count("apple", "q")).to eq(0)
        expect(letter_count("MISSIPPI", "i")).to eq(3)
    end
end