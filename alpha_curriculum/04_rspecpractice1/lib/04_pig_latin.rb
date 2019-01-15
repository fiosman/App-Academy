def translate(sentence)
  translated_words = sentence.split(" ").map do |word|
    translate_word(word)
  end
  translated_words.join(" ")
end

def translate_word(word)
  vowels = %w(a e i o u)
  if vowels.include?(word[0])
    "#{word}ay"
  else
    phoneme_end = 0
    until vowels.include?(word[phoneme_end])
      phoneme_end += 1
    end
    phoneme_end += 1 if word[phoneme_end - 1] == "q"
    "#{word[phoneme_end..-1]}#{word[0...phoneme_end]}ay"
  end
end

