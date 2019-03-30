require 'set'
require 'byebug'

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name, source)
    @dictionary = Set.new(File.read(dictionary_file_name).split("\n"))
    @current_words = []
    @all_seen_words = []
  end

  def adjacent_words(word)
    #check for length
    same_length_words = self.dictionary.select { |word_d| word_d.length == word.length }
    #check for words that are different by 1 character at only 1 position
    #strategy - loop through the chars of each dictionary word, compare to chars of the given word. If letter at only 1 position is not the same, push that word to selected_words array. 
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

  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]

    until @current_words.empty? 
      new_current_words = []
      explore_current_words(new_current_words)
      p new_current_words
      @current_words = new_current_words
    end
  end

  def explore_current_words(c_words)
     @current_words.each do |c_word| 
        adjacent_words(c_word).each do |adj_current_word| 
          next if @all_seen_words.include?(adj_current_word)
          c_words << adj_current_word 
          @all_seen_words << adj_current_word
        end
      end
  end

end


 word_c = WordChainer.new("dictionary.txt")
p word_c.adjacent_words('yow')
#p word_c.dictionary

