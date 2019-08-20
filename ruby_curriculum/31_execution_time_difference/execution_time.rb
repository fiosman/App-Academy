#O(n) time 
def my_min(arr)
  min = arr.first 

  (1..arr.length-1).each do |idx|
    min = arr[idx] if arr[idx] < min 
  end
  return min
end

