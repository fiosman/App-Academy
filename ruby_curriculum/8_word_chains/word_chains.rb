require 'set'
require 'byebug'

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = Set.new(File.read(dictionary_file_name).split)
  end

  def adjacent_words(word)
    #check for length
    same_length_words = self.dictionary.select { |word_d| word_d.length == word.length }
    #check for words that are different by only one character
    #keep a counter, it should be only 1, if higher than 1, do not return the word, if 1, return it 
    #debugger
    selected_words = []
    counter = 0 
    same_length_words.each do |d_word|
      (0...d_word.length).each do |idx| 
        if !word.include?(d_word[idx])
          counter += 1
        end
      end
    selected_words << d_word if counter == 1 
    counter = 0
    end
    selected_words
  end

end


word_c = WordChainer.new("dictionary.txt")
p word_c.adjacent_words('yow')

