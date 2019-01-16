require 'byebug'

# EASY

# Define a method that returns an array of only the even numbers in its argument
# (an array of integers).
def get_evens(arr)
  arr.select { |ele| ele.even? }
end

# Define a method that returns a new array of all the elements in its argument
# doubled. This method should *not* modify the original array.
def calculate_doubles(arr)
  arr.map { |ele| ele * 2 }
end

# Define a method that returns its argument with all the argument's elements
# doubled. This method should modify the original array.
def calculate_doubles!(arr)
  arr.map! { |ele| ele * 2 }
end

# Define a method that returns the sum of each element in its argument
# multiplied by its index. array_sum_with_index([2, 9, 7]) => 23 because (2 * 0) +
# (9 * 1) + (7 * 2) = 0 + 9 + 14 = 23
def array_sum_with_index(arr)
  sum = 0
  arr.each_with_index { |ele, idx| sum+= ele*idx }
  return sum
end

# MEDIUM

# Given an array of bids and an actual retail price, return the bid closest to
# the actual retail price without going over that price. Assume there is always
# at least one bid below the retail price.
def price_is_right(bids, actual_retail_price)
  #select array elements that are less than the actual retail price, 
  #then take the max of the returned array
  bids.select! { |ele| ele <= actual_retail_price }
  return bids.max
end

# Given an array of numbers, return an array of those numbers that have at least
# n factors (including 1 and the number itself as factors).
# at_least_n_factors([1, 3, 10, 16], 5) => [16] because 16 has five factors (1,
# 2, 4, 8, 16) and the others have fewer than five factors. Consider writing a
# helper method num_factors
def at_least_n_factors(numbers, n)
  numbers.select { |ele| num_factors(ele) >= n }
end

def num_factors(number)
  (1..number).reduce(0) do |count, num| 
    if number % num == 0
      count + 1
    else
      count
    end
  end
end

# HARD

# Define a method that accepts an array of words and returns an array of those
# words whose vowels appear in order. You may wish to write a helper method:
# ordered_vowel_word?

def ordered_vowel_word?(word)
  vowels = "aeiou"
  word_arr = word.split("")

  word_arr.select! do |letter|
    vowels.include?(letter) 
  end
    word_arr == word_arr.sort
end

def ordered_vowel_words(words)
  words.reject { |ele| !ordered_vowel_word?(ele) }
end

# Given an array of numbers, return an array of all the products remaining when
# each element is removed from the array. You may wish to write a helper method:
# array_product.

# products_except_me([2, 3, 4]) => [12, 8, 6], where: 12 because you take out 2,
# leaving 3 * 4. 8, because you take out 3, leaving 2 * 4. 6, because you take out
# 4, leaving 2 * 3

# products_except_me([1, 2, 3, 5]) => [30, 15, 10, 6], where: 30 because you
# take out 1, leaving 2 * 3 * 5 15, because you take out 2, leaving 1 * 3 * 5
# 10, because you take out 3, leaving 1 * 2 * 5 6, because you take out 5,
# leaving 1 * 2 * 3

def array_product(array)
  array.reduce(:*)
end

def products_except_me(numbers)
  new_arr = []
  numbers.each_index do |idx| 
    sub_arr = numbers.reject { |ele| ele == numbers[idx] }
    product = array_product(sub_arr)
    new_arr.push(product)
  end
  return new_arr
end





