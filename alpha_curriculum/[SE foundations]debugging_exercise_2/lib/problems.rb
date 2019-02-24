# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require 'byebug'

def largest_prime_factor(num)
  factors = []

  (2..num).each do |factor| 
    if num % factor == 0
      factors << factor
    end
  end

  factors.select do |ele| 
    prime?(ele)
  end.max
end

def prime?(num)
  (2...num).each do |factor| 
    if num % factor == 0 
      return false
    end
  end
  true
end

def unique_chars?(string) 
  
  string.each_char do |char| 
    if string.count(char) > 1
      return false
    end
  end
  true
end

def dupe_indices(array)
  hsh = {}

  array.each do |ele| 
    if array.count(ele) > 1
      hsh[ele] = get_indices(array,ele)
    end
  end
  hsh
end

def get_indices(array, num)
  new_arr = []

  array.each_index do |idx| 
    if array[idx] == num 
      new_arr << idx
    end
  end
  new_arr
end

def ana_array(array_1, array_2)
  array_1.concat(array_2).all? { |ele| array_1.count(ele) > 1 } 
end

