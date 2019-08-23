require 'byebug'

require 'benchmark'

#O(n) time 
def my_min(arr)
  min = arr.first 

  (1..arr.length-1).each do |idx|
    min = arr[idx] if arr[idx] < min 
  end
  return min
end

#O(n^3) time
def largest_contiguous_subsum(list)
  sub_arrs = []

  list.each_index do |idx1| 
    (idx1..list.length-1).each do |idx2| 
      sub_arrs << list[idx1..idx2]
    end
  end
  sub_arrs.map(&:sum).max
end

#O(n) time -- Kadane's Algorithm
def better_largest_contiguous_subsum(list)
  total_sum = list.first
  current_sum = list.first

  list.each_index do |idx| 
    current_sum = [list[idx], current_sum + list[idx]].max
    total_sum = [total_sum, current_sum].max
  end

  return total_sum
end

