def palindrome?(str)
  new_word = ""

  i = str.length - 1
  while i >= 0
     new_word += str[i]
     i-=1
  end
  return new_word == str
end

def substrings(str)
  arr = []
  (0...str.length).each do |start_word| 
    (start_word...str.length).each do |end_word| 
      arr << str[start_word..end_word]
    end
  end
  arr
end

def palindrome_substrings(str)
  substrings(str).select do |word| 
    word.length > 1 && palindrome?(word)
  end
end

