require 'set'

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = Set.new(File.read(dictionary_file_name).split)
  end

  def adjacent_words(word)
    same_length_words = self.dictionary.select { |word_d| word_d.length == word.length }
  end

end

#word_c = WordChainer.new("dictionary.txt")
#p word_c.dictionary

