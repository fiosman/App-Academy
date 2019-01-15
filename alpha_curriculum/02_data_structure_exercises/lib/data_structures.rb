# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  arr.max - arr.min
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  arr.sort === arr
end

# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  count = 0
  vowels = "aeiou"
  str.each_char do |char| 
    if vowels.include?(char.downcase)
      count+= 1
    end 
  end
  return count
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  vowels = "aeiou"
  newStr = "" 
  str.each_char do |char| 
    if !vowels.include?(char.downcase)
      newStr+= char 
    end
  end
  return newStr
end

# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  str = int.to_s
 return arr = str.split("").sort.reverse
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  str.downcase!
  str.each_char.with_index do |char, idx| 
    if char === str[idx + 1]
      return true
    end
  end
  return false
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  # your code goes here
  first_sec = "(" + arr[0..2].join + ")"
  middle_sec = " " + arr[3..5].join
  last_sec = "-" + arr[6..-1].join
  return first_sec + middle_sec + last_sec
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  str_arr = str.split(",")
  new_arr =  str_arr.map { |ele| ele.to_i}
 return new_arr.max - new_arr.min
end

#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
    move_position = offset % arr.length
    removed_ele = arr.take(move_position)
    position_after_remove = arr.drop(move_position)
    return position_after_remove + removed_ele
end
