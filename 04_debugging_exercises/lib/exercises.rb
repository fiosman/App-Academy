# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'.

require 'byebug'

LITTLE_WORDS = [
  "and",
  "the",
  "over", 
  "a", 
  "of"
]

def titleize (words)
  little_words = ['the', 'over', 'and']
  words_arr = words.split(" ")

  words_arr.each_with_index do |word, idx| 
    if LITTLE_WORDS.include?(word) && idx != 0
      word.downcase!
    else 
      word.capitalize!
    end
  end
  return words_arr.join(" ")
end

# Write a method that returns the largest prime factor of a given integer.
#factor is a number that divisible by the given number, for example factors of 12 are 6
#2, 3, 4, 1,  and 12. Prime means numbers that are only divisible by thesmelves and one. 
def prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
end

 def largest_prime_factor(num)
  return nil if num <= 1
  num.downto(2) do |factor|
    if (num % factor).zero?
      return factor if prime?(factor)
    end
  end
end

#Write a symmetric_substrings method that takes a string and returns an array
# of substrings that are palindromes, e.g. symmetric_substrings("cool") => ["oo"]
# Only include substrings of length > 1.

def symmetric_substrings(str)
  symm_subs = []

  str.length.times do |start_pos|
    (2..(str.length - start_pos)).each do |len|
      substr = str[start_pos...(start_pos + len)]
      symm_subs << substr if substr == substr.reverse
    end
  end
  symm_subs
end

# Write a method that returns `true` if all characters in the string
# are unique and `false` if they are not.

def all_unique_chars?(str)
  letters = str.split('').reject { |char| char == '  '}
  letters.uniq.length == letters.length
end

