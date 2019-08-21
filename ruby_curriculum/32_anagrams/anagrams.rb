#O(n^2) time 
#O(1) space 
def second_anagram(str1, str2)
  str1.each_char do |char| 
    selected_index = str2.index(char)
    return false if !selected_index

    str2.slice!(selected_index)
  end

  str2.empty?
end

#O(n log(n)) time 
#O(n) space 
def third_anagram(str1, str2) 
  sorted_str1 = str1.split("").sort
  sorted_str2 = str2.split("").sort

  sorted_str1 == sorted_str2
end

#O(n) time 
#O(1) space === Yes, the keys we are inserting into the hash are chars in the string, but there is always a maximum of 26 letters. So it is constant. 
def fourth_anagram(str1, str2) 
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  str1.each_char { |char| str1_hash[char] += 1 }
  str2.each_char { |char| str2_hash[char] += 1 }

  str1_hash == str2_hash 
end


