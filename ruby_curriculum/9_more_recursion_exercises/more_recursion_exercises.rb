#Problem 1: You have array of integers. Write a recursive solution to find the sum of the integers.

def sum_recur(array)
  return array.first if array.size == 1
  array.first + sum_recur(array[1..-1])
end

p sum_recur([1,2,3,4])

#Problem 2: You have array of integers. Write a recursive solution to determine whether or not the array contains a specific value.

def includes?(array, target)
end

# Problem 3: You have an unsorted array of integers. Write a recursive solution to count the number of occurrences of a specific value.

def num_occur(array, target)
end

# Problem 4: You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
end

# Problem 5: You have array of integers. Write a recursive solution to determine if the array is sorted.

def sorted?(array)
end

# Problem 6: Write a recursive function to reverse a string. Don't use any built-in #reverse methods!

def reverse(string)
end
