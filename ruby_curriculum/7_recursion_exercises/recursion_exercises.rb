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
 def merge_sort(arr)
  return arr if arr.length <= 1 

  mid = arr.length/2
  left_arr = arr[0...mid]
  right_arr = arr[mid..-1]

  sorted_left_arr = merge_sort(left_arr)
  sorted_right_arr = merge_sort(right_arr)

  merge(sorted_left_arr, sorted_right_arr)
 end

def merge(left_arr, right_arr)
  merged_arr = []
  left_arr_idx, right_arr_idx = 0, 0

  while left_arr_idx < left_arr.length && right_arr_idx < right_arr.length
    if left_arr[left_arr_idx] <= right_arr[right_arr_idx] 
      merged_arr << left_arr[left_arr_idx]
      left_arr_idx += 1
    else
      merged_arr << right_arr[right_arr_idx]
      right_arr_idx += 1
    end
  end

  while left_arr_idx < left_arr.length
    merged_arr << left_arr[left_arr_idx]
    left_arr_idx += 1
  end

  while right_arr_idx < right_arr.length
    merged_arr << right_arr[right_arr_idx]
    right_arr_idx += 1
  end
  
  merged_arr
end

#Write a method subsets that will return all subsets of an array.
def subsets(arr)
  #consider what happens if an empty array is passed in... Well, we just return an empty array. 
  #And if a single element is passed in? We return a subet containing two elements, the element itself and the empty array. 
  #so first thing we have to do is get the empty array if that single element is passed in. To do this, we can reduce the array size to nothingness.
  #Then all we have to do is concatenate the single empty array to the single element passed in (in this case the last element in the array) to make a subset. 
  #This solution should return a total of 2**arr.length subsets. Does not correct for proper subsets.  (i.e. (2**arr.length) - 1)
  return [[]] if arr.empty?
  subsets = subsets(arr[0...arr.length-1]) 
  subsets + subsets.map { |subset| subset += [arr.last] }
end

#Write a recursive method permutations(array) that calculates all the permutations of the given array. 
#For an array of length n there are n! different permutations. 
#So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.
def permutations(array)
  return [array] if array.size <= 1  

  total_perms = []
  array.each_with_index do |num, idx| 
    #As we iterate through the array, add the current element to the beginning of each permutation of the remaining elements. 
    permutations(array[0...idx] + array[idx+1..-1]).each { |perm| total_perms << [num] + perm }
  end
  total_perms
end

#Making Change problem - http://web.archive.org/web/20130215052843/http://rubyquiz.com/quiz154.html
def greedy_make_change(change, coins = [10,25,1,5])
  #debugger
  coin_change = []

  max_coin = coins.sort.last
  coin_count = change/max_coin 

  coin_count.times { coin_change << max_coin }
  remaining_amount = change - coin_change.sum

  if !remaining_amount.zero?
   coin_change += greedy_make_change(remaining_amount, coins - [coins.sort.pop])
  end
  coin_change

end

#p greedy_make_change(54) #=> [25,25,1,1,1,1]
#p greedy_make_change(24, [10,7,1]) #=> incorrectly returns [10,10,1,1,1,1], should be [10,7,7]. Calls for a better version!

def make_better_change(change, coins=[10,25,1,5])
  #debugger
  return [] if change == 0 

  coin_change =  []
  
  coins.each do |coin| 
    next if coin > change
    remaining_change = change - coin
    coin_change << [coin] + make_better_change(remaining_change, coins)
  end
  coin_change.sort_by { |change| change.length }.first
end


