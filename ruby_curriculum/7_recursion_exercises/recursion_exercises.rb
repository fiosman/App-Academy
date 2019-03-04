#Write both a recursive and iterative version of sum of an array.

#Iterative approach
def sum_iterative(array)
  array.reduce(&:+)
end

#Recursive approach 
def sum_recursive(array) 
  return array.first if array.length == 1
  array.first + sum_recursive(array[1..-1])
end

#Write a recursive method, range, that takes a start and an end and returns an array of all 
#numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. 
#If end < start, you can return an empty array. 

def range(start_range, end_range)
  return [] if end_range <= start_range
  range(start_range, end_range - 1) << end_range - 1
end
