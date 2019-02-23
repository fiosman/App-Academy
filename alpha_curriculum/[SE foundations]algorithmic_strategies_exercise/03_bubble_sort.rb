# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def bubble_sort(arr)

  return arr if arr.size <= 1

  loop do 
     swapped = false
    (arr.length-1).times do |idx| 
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


#Bubble Sort - Pretty simple sorting algorithm. Also INEFFICIENT. Never use it!
#Its purpose is to arrange an array of numbers in increasing order. 
#Does this by comparing adjacent pairs, if first number in the pair is larger than the second then swap the values.
#The key is to make sure the above keeps going until the array is entirely sorted. 
#This is done pretty easily by assigning a variable that keeps track of the "swapped status" through each pass. 
#If no swaps are made, swapped is false and the array is sorted. Otherwise, swapped is true -- Program keeps running until swapped is false. 
