require "half_and_double"

describe "half_and_double" do
    it "should return a new array where every even number is divided by 2 and every odd number is multipled by 2" do
        expect(half_and_double([4, 5, 7, 10])).to eq([2, 10, 14, 5])
        expect(half_and_double([20, 25, 12, 13])).to eq([10, 50, 6, 26])
    end
end