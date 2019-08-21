#O(n) time 
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
