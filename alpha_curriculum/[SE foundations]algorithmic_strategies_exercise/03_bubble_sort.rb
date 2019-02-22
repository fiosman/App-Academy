# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def bubble_sort(arr)

  return arr if arr.size <= 1

  loop do 
     swapped = false
    (0...arr.length - 1).each do |idx| 
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
        swapped = true
      end
    end 
    break if not swapped
  end
  arr
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]