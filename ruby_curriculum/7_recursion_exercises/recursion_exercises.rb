#Write a recursive method, range, that takes a start and an end and returns an array of all 
#numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. 
#If end < start, you can return an empty array. Write both a recursive and iterative version of sum of an array.

#Iterative approach
def range(start_range, end_range)
  (start_range...end_range).inject([]) do |array, ele|
    array << ele 
  end
end

#Recursive approach 