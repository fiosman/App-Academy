require "fuzz_buzz"

describe "fuzz_buzz" do
    it "should return an array of numbers from one to the given number that are not divisible by 3 or 5" do
        expect(fuzz_buzz(11)).to eq([1, 2, 4, 7, 8, 11])
        expect(fuzz_buzz(20)).to eq([1, 2, 4, 7, 8, 11, 13, 14, 16, 17, 19])
    end
end