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


