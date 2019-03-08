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
def deep_dup 

end

