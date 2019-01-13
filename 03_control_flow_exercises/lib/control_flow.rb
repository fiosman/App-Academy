# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.each_char do |char| 
    if char === char.downcase
      str.delete!(char)
    end
  end 
   str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  if str.length.even?
    return str[str.length / 2-1..str.length / 2]
  else 
    return str[str.length / 2]
  end
end

# Return the number of vowels in a string.

def num_vowels(str)
  count = 0
  vowels = "aeiou"
  str.each_char do |char| 
    if vowels.include?(char)
      count+=1
    end
  end
  count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  product = 1 
  i = num 

  while i > 0
    product *= i  
    i-=1 
  end
  product

end

# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  str = ""
  arr.each do |ele|
    if ele != arr[-1]
      joint_string = ele + separator 
      str += joint_string
    else 
      str += ele
    end
  end
  str 
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  weirdo_str = ""
  str.each_char.with_index do |char, idx| 
    if idx.odd? 
      weirdo_str += char.upcase
    else
      weirdo_str += char.downcase
    end
  end
  weirdo_str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  arr = str.split (" ")
  arr.each { |ele| ele.reverse! if ele.length >=5 } 
  arr.join(" ") 
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  arr = []
  (1..n).each do |num| 
    if num % 3 === 0  && num % 5 === 0
      arr.push('fizzbuzz')
    elsif num % 5 === 0 
      arr.push('buzz')
    elsif num % 3 === 0 
      arr.push('fizz')
    else
      arr.push(num)
    end
  end
  arr
end

# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  reversedArr = []
  i = arr.length - 1 

  while i >= 0 
    reversedArr << arr[i]
    i-=1
  end
  return reversedArr
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  if num === 1
    return false
  end
  
  i = 2
  while i < num
    if num % i == 0 
      return false
    end
    i+=1
  end
  return true

end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  arr = []

  (1..num).each do |ele| 
    if num % ele == 0 
      arr << ele
    end
  end
  arr.sort
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  sorted_arr = []
  arr = factors(num)

  arr.each do |ele| 
    if prime?(ele)
      sorted_arr.push(ele)
    end
  end
  sorted_arr
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors_arr = prime_factors(num)
  prime_factors_arr.count
end

# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  odds = []
  evens = []

  arr.each do |ele| 
    if ele % 2 === 0
      evens << ele
    else
      odds << ele
    end
  end

  if odds.length === 1
    return odds[0]
  else
    return evens[0]
  end
  
end
