require "many_vowel_words"

describe "many_vowel_words" do
    it "should return the sentence only containing words with two or more vowels" do
        expect(many_vowel_words("Hello world, how are you")).to eq("Hello are you")
        expect(many_vowel_words("The quick brown fox jumps over the lazy dog")).to eq("quick over")
        expect(many_vowel_words("The Missippi river is quite the river")).to eq("Missippi river quite river")
    end
end