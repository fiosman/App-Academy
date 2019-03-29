require 'byebug'

#Problem 1: You have array of integers. Write a recursive solution to find the sum of the integers.

def sum_recur(array)
  return array.first if array.size == 1
  array.first + sum_recur(array[1..-1])
end

#p sum_recur([1,2,3,4]) # => 10

#Problem 2: You have array of integers. Write a recursive solution to determine whether or not the array contains a specific value.

def includes?(array, target)
  return true if array.first == target 
  return false if array.empty? 
  includes?(array[1..-1], target)
end

#p includes?([1,2,3], 4) # => false 

# Problem 3: You have an unsorted array of integers. Write a recursive solution to count the number of occurrences of a specific value.

def num_occur(array, target)
  
end

# Problem 4: You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  #debugger
  return false if array.size == 1 
  return true if array[-2] + array[-1] == 12
  add_to_twelve?(array[1..-1])
end

p add_to_twelve?([1,2,3,4,8])

# Problem 5: You have array of integers. Write a recursive solution to determine if the array is sorted.

def sorted?(array)
  return true if array.size == 1 
  return false if array.first > array.last
  sorted?(array[1..-1])
end

#p sorted?(18, 1, 2, 9, 1101)
#p sorted?(7, 19, 22, 42, 113)

# Problem 6: Write a recursive function to reverse a string. Don't use any built-in #reverse methods!

def reverse(string)
  return string if string.length == 1 
  string[-1] + reverse(string[0...-1])
end

#p reverse('hello')
