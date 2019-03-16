#Write both a recursive and iterative version of sum of an array.
require 'byebug'
#Iterative approach
def sum_iterative(array)
  array.reduce(&:+)
end

#Recursive approach 
def sum_recursive(array) 
  return array.first if array.length == 1
  array.first + sum_recursive(array[1..-1])
end

#sum_recursive([1,2,3,4,5])

#first call => 1 + sum_recursive([2,3,4,5]) => 15
#second call => 2 + sum_recursive([3,4,5]) => 14
#third call => 3 + sum_recrusive([4,5]) => 12
#fourth call => 4 + sum_recursive([5]) => 9
#fifth call => 5


#Write a recursive method, range, that takes a start and an end and returns an array of all 
#numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. 
#If end < start, you can return an empty array. 

def range(start_range, end_range)
  return [] if end_range <= start_range
  range(start_range, end_range - 1) << end_range - 1
end

#Write a recursive and an iterative Fibonacci method. 
#The method should take in an integer n and return the first n Fibonacci numbers in an array.

def fibonacci_iterative(n)
  init = [0,1]
  return init if n <= 2

  while init.length < n 
    init << init[-1] + init[-2]
  end
  init
end

def fibonacci_recursive(n)
  return [0] if n == 0 
  return [0,1] if n == 1
  fib_arr = fibonacci_recursive(n-1)
  fib_arr.push(fib_arr[-1] + fib_arr[-2])
end

#Write two versions of exponent that use two different recursions
def first_exponent(base, pwr)
  return 1 if pwr == 0
  base * first_exponent(base,pwr-1)
end

def second_exponent(base, pwr)
  if pwr == 0 
    return 1
  elsif pwr % 2 == 0 
    res = second_exponent(base, pwr/2)
    res * res
  else
    base * second_exponent(base, pwr-1) 
  end
end

#Using recursion and the is_a? method, write an Array#deep_dup method 
#that will perform a "deep" duplication of the interior arrays.

class Array
  def deep_dup 
    self.reduce([]) { |arr, ele| ele.is_a?(Array) ? arr += ele.deep_dup : arr << ele } 
  end
end


#Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). 
#Hint: you will probably want to use subarrays.

def bsearch(array, target )
  
  return nil if array.empty? 

  mid_index = array.length/2

  case array[mid_index] <=> target 
  when -1 
    #target > array[mid_index] => upper half search
    rsearch = bsearch(array[mid_index + 1...array.length], target) 
    rsearch.nil? ? nil : mid_index + rsearch + 1
  when 0 
    #target == array[mid_index] => found element
    mid_index 
  when 1 
    #target < array[mid_index] => lower_half search
    bsearch(array[0...mid_index], target)
  end

end

#Implement a method merge_sort that sorts an Array:
 def merge_sort(lo, hi)

 end

def merge(left_arr, right_arr)
  merged_arr = []
  left_arr_idx, right_arr_idx = 0, 0
  left_n, right_n = left_arr.size, right_arr.size

  while left_arr_idx < left_n && right_arr_idx < right_n
    if left_arr[left_arr_idx] <= right_arr[right_arr_idx] 
      merged_arr << left_arr[left_arr_idx]
      left_arr_idx += 1
    else
      merged_arr << right_arr[right_arr_idx]
      right_arr_idx += 1
    end
  end

  while left_arr_idx < left_n 
    merged_arr << left_arr[left_arr_idx]
    left_arr_idx += 1
  end

  while right_arr_idx < right_n 
    merged_arr << right_arr[right_arr_idx]
    right_arr_idx += 1
  end
end





