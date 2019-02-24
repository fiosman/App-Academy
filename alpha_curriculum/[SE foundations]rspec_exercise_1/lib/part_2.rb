def hipsterfy(word)
  vowels = "aeiou"
  split_word = word.chars

  i = split_word.length - 1
  
  while i >= 0 
    if vowels.include?(split_word[i])
      split_word.delete_at(i)
      break
    end
    i-=1
  end
  split_word.join("")
end

def vowel_counts(string)
  hsh = Hash.new(0)
  vowels = 'aeiou'

  string.each_char do |char| 
    if vowels.include?(char.downcase)
      hsh[char.downcase] += 1
    end
  end
  hsh
end

def caesar_cipher(message, n)
  alphabet = ('a'..'z').to_a
  new_message = ""

  message.each_char do |char| 
    if alphabet.include?(char)
      new_message += char.replace(alphabet[(alphabet.index(char) + n) % alphabet.length])
    else
      new_message += char
    end
  end
  new_message
end

p caesar_cipher('zebra', 4)