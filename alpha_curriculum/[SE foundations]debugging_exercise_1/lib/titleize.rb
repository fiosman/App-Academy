# Debug this code to pass rspec! There are 2 mistakes to fix.

# Write a method, titleize, that accepts a string representing a title 
# and capitalizes each word in a string except 'a', 'and', 'of', 'on', or 'the'.
# The first word of the title should be capitalized no matter what.

require "byebug"

LITTLE_WORDS = [ "and", "the", "over", "a", "on", "of" ] #change into a constant

def titleize(title)
  words = title.split(" ")
  debugger
  titleized_words = words.map.with_index do |word, i| #swapped block parameters, it was incorrectly |i, word|
    if i == 0 || !LITTLE_WORDS.include?(word)
      word.capitalize
    else
      word.downcase
    end
  end

  titleized_words.join(" ")
end

p titleize('war and peace')