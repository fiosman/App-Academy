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