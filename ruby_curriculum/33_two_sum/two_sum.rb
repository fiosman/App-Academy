require 'byebug'

#O(n^2) time 
#O(1) space
def bad_two_sum?(target, arr)
  arr.each_index do |idx1| 
    (idx1+1...arr.length).each do |idx2| 
      return true if arr[idx1] + arr[idx2] == target
    end
  end
  false
end

#O(n log (n)) time => Ruby's quick sort algorithm 
#O(n) space 
def okay_two_sum?(target, arr) 
  sorted_arr = arr.sort
  lo = 0 
  hi = sorted_arr.length - 1 

  while lo < hi 
    if sorted_arr[lo] + sorted_arr[hi] == target 
      return true 
    else
      sorted_arr[lo] + sorted_arr[hi] < target ? lo += 1 : hi -= 1
    end
  end

  false
end

#O(n) time
#O(n) space
def best_two_sum(target, arr)
  #byebug
  nums_hash = {}

  arr.each do |ele| 
    return true if nums_hash[target - ele] == true
    nums_hash[ele] = true
  end

  false
end