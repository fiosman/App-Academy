require "problems"

describe "least_common_multiple" do
    it "should return the least common multiple of 4 and 10" do
        expect(least_common_multiple(4, 10)).to eq(20)
        expect(least_common_multiple(10, 4)).to eq(20)
    end

    it "should return the least common multiple of 7 and 21" do
        expect(least_common_multiple(7, 21)).to eq(21)
        expect(least_common_multiple(21, 7)).to eq(21)
    end
end

describe "most_frequent_bigram" do
    it "should return the bigram that appears the most in the string" do
        expect(most_frequent_bigram("thethrillofit")).to eq("th")
        expect(most_frequent_bigram("gotothemoonsoonforproof")).to eq("oo")
        expect(most_frequent_bigram("bananasareanotherfruit")).to eq("an")
    end
end

describe "Hash" do
    describe "#inverse" do
        it "should swap the keys and values in the hash" do
            expect({"a"=>1, "b"=>2}.inverse).to eq({1=>"a", 2=>"b"})
            expect({"name"=>"fido", "hungry"=>true}.inverse).to eq({"fido"=>"name", true=>"hungry"})
        end
    end
end

describe "Array" do
    describe "#pair_sum_count" do
        it "should return the number of pairs of elements that add to the given num" do
            expect([1, 2, 1, 3, 8].pair_sum_count(5)).to eq(1)
            expect([10, 3, 6, 5, 7].pair_sum_count(13)).to eq(2)
            expect([10, 3, 6, 5, 7].pair_sum_count(4)).to eq(0)
        end
    end

    describe "#bubble_sort" do
        context "when no proc is given as an arg" do
            it "should sort the array in increasing order by default" do
                expect([4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort).to eq([1, 2, 4, 8, 9, 12, 14, 24, 25, 81])
            end 
        end

        context "when a proc is given as an arg" do
            it "should sort the array according to proc" do
                actual = [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort { |a, b| a.to_s <=> b.to_s } # this block will sort the numbers "alphabetically" by characters
                expect(actual).to eq([1, 12, 14, 2, 24, 25, 4, 8, 81, 9])
            end
        end

        it "should mutate the existing array" do
            array = [5, 4, 7]
            expect(array.bubble_sort).to be(array)
            expect(array).to eq([4, 5, 7])
        end
    end
end

