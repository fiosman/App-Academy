require 'set'
require 'byebug'

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = Set.new(File.read(dictionary_file_name).split("\n"))
  end

  def adjacent_words(word)
    #check for length
    same_length_words = self.dictionary.select { |word_d| word_d.length == word.length }
    #check for words that are different by 1 character at only 1 position
    #strategy - loop through the chars of the word, then return the index of the letter that is different from the dictionary word. Keep track in a counter
    #debugger
    selected_words = []
    diff_counter = 0 

    same_length_words.each do |d_word| 
      (0...d_word.length).each do |idx| 
        if d_word[idx] != word[idx]
          diff_counter += 1
        end
      end
      selected_words << d_word if diff_counter == 1
      diff_counter = 0 
    end
    selected_words
  end

  #   word_chars.each_with_index do |d_word, idx1|
  #     (0...d_word.length).each do |idx2| 
  #       if !word_chars.include?(d_word[idx])
  #         counter += 1
  #       end
  #     end
  #   selected_words << d_word if counter == 1 
  #   counter = 0
  #   end
  #   selected_words
  # end

end


 word_c = WordChainer.new("dictionary.txt")
p word_c.adjacent_words('yow')
#p word_c.dictionary

