require 'byebug'

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