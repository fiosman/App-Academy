def echo(string) 
  string
end

def shout(string)
  string.upcase
end

def repeat(string, num=2)
  arr = []
  num.times do |i|
    arr << string
  end
  return arr.join(" ")
end

def start_of_word(string, num_letters)
  return string[0...num_letters]
end

def first_word(string)
  arr = string.split(" ")
  return arr.first
end

def titleize (words)
  little_words = ['the', 'over', 'and']
  words_arr = words.split(" ")

  words_arr.each_with_index do |word, idx| 
    if little_words.include?(word) && idx != 0
      word.downcase!
    else 
      word.capitalize!
    end
  end
  return words_arr.join(" ")
end

