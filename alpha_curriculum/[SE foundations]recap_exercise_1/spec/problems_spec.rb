require "problems"

describe "all_vowel_pairs" do
    it "should return all pairs of words that contain every vowel" do
        expect(all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])).to eq(["action europe", "tear impromptu"])
        expect(all_vowel_pairs(["upper", "goalie", "unstoppable", "cranky", "terrible"])).to eq(["upper goalie", "goalie unstoppable", "unstoppable terrible"])
        expect(all_vowel_pairs(["city", "stair", "dog"])).to eq([])
    end
end

describe "composite?" do
    it "should return a boolean indicating if the number has factors besides 1 and itself" do
        expect(composite?(9)).to eq(true)
        expect(composite?(12)).to eq(true)
        expect(composite?(4)).to eq(true)
        expect(composite?(7)).to eq(false)
        expect(composite?(13)).to eq(false)
        expect(composite?(31)).to eq(false)
    end
end

describe "find_bigrams" do
    it "should return an array of the bigrams found in the string" do
        expect(find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])).to eq(["em", "ty", "ea"])
        expect(find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])).to eq(["ck", "oo"])
        expect(find_bigrams("to the moon and back", ["ty", "no", "tr"])).to eq([])
    end
end

describe "Hash" do
    describe "#my_select" do
        it "should return a new hash containing key-value pairs that return true when passed into the prc"  do
            hash_1 = {x: 7, y: 1, z: 8}
            expect(hash_1.my_select { |k, v| v.odd? }).to eq({x: 7, y: 1})
            expect(hash_1.my_select { |k, v| v > 5 }).to eq({x: 7, z: 8})

            hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
            expect(hash_2.my_select { |k, v| k + 1 == v }).to eq({10=>11, 5=>6, 7=>8})
        end

        context "when no proc is given" do
            it "should return the pairs where the key is equal to the value" do
                hash = {"cat"=>"dog", "purple"=>"purple", "sound"=>"music", "open"=>"open"}
                expect(hash.my_select).to eq({"purple"=>"purple", "open"=>"open"})
            end
        end
    end
end

describe "String" do
    describe "#substrings" do
        context "when no length is given" do
            it "should return all substrings" do
                expect("cats".substrings).to match_array ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
            end
        end

        context "when a length is given" do
            it "should return all substrings of that length" do
                expect("cats".substrings(2)).to match_array ["ca", "at", "ts"]
                expect("boots".substrings(3)).to match_array ["boo", "oot", "ots"]
            end
        end
    end

    describe "#caesar_cipher" do
        it "should shift each character of the string by the given amount in the alphabet" do 
            expect("apple".caesar_cipher(1)).to eq("bqqmf")
            expect("bootcamp".caesar_cipher(2)).to eq("dqqvecor")
            expect("zebra".caesar_cipher(4)).to eq("difve")
        end
    end
end