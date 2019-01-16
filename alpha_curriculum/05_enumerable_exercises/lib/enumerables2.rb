require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  arr.reduce(0, :+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.all? { |string| string.include?(substring) }
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  words = string.split("")
  new_arr = []
  words.each do |char| 
    if words.count(char) > 1 && char != " "
      new_arr << char
    end
  end 
  new_arr.uniq.sort
end


# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  string.delete!(',.?:;"!"')
  word_arr = string.split(" ").sort_by { |word| word.length }.reverse!
  word_arr[0..1]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  letters = ('a'..'z').to_a
  letters.reject { |char| string.downcase.include?(char) }
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?

def not_repeat_year?(year) 
  str = year.to_s
  str.each_char do |ele| 
    if str.count(ele) > 1
      return false
    end
  end
  true
end

def no_repeat_years(first_yr, last_yr)
  arr = (first_yr..last_yr).to_a
  arr.select do |ele| 
    not_repeat_year?(ele)
  end
end

# HARD
# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?

def no_repeats?(song_name, songs)
  songs.each_with_index do |ele, idx| 
    if ele == song_name
      return false if ele == songs[idx + 1]
    end
  end
  true
end

def one_week_wonders(songs)
  new_arr = songs.select do |song| 
    no_repeats?(song, songs)
  end
  return new_arr.uniq
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def c_distance(word)
  word.delete!(',.?!;:')
  word.reverse.index('c')
end

def for_cs_sake(string)
  words_arr = string.split(" ")
  c_arr = words_arr.select { |el| el.downcase.include?('c') }
  return "" if c_arr.empty?
  c_arr.sort_by { |el| c_distance(el) }.first
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(numbers)
  result = []
  sub_arr = []
  i = 0 
  while i < numbers.length 
    if sub_arr.length == 0 && numbers[i] == numbers[i+1]
      sub_arr << i
    elsif sub_arr.length == 1 && numbers[i] != numbers[i+1]
      sub_arr << i
      result << sub_arr
      sub_arr = []
    end
    i+=1
  end
    result
end


