#O(n) time 
def my_min(arr)
  min = arr.first 

  arr.each do |ele|
    min = ele if ele < min 
  end
  return min
end