require 'byebug'

def select_even_nums(numbers) 
  numbers.select(&:even?)
end

def reject_puppies(hash_array)
  hash_array.reject { |ele| ele["age"] < 3 }
end

def count_positive_subarrays(arr)
  arr.count { |sub_arr| sub_arr.sum > 0 }
end

def aba_translate(word)
  vowels = 'aeiou'
  new_word = ""
  word.each_char.with_index do |char, idx| 
    if vowels.include?(char)
      new_word += char + "b" + char
    else
      new_word += char
    end
  end
 new_word
end

def aba_array(words_array)
  words_array.map { |word| aba_translate(word) } 
end





  