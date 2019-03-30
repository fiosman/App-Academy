# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  (1..num).reduce([]) do |factors_arr, number|
    if num % number == 0 
      factors_arr << number
    else
      factors_arr
    end
  end
end

# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  arr = []
  (0...string.length).each do |start_of_word| 
    (start_of_word...string.length).each do |sub_str_idx|
       sub_str = string[start_of_word..sub_str_idx]
       arr << sub_str 
    end
  end
  arr.uniq
end

def subwords(word, dictionary)
  substrings(word).select { |ele| dictionary.include?(ele) }
end

# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.

class Array
  def bubble_sort!
    n = self.length 
    loop do 
      swapped = false
      (n-1).times do |i| 
        if self[i] > self[i + 1]
          self[i], self[i+1] = self[i+1], self[i]
          swapped = true
        end
      end
      break if not swapped
    end
    self 
  end
end