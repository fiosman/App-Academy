# Debug this code to pass rspec! There are 3 mistakes to fix.

# Write a method, letter_count, that accepts a string and char as args. 
# The method should return the number of times that the char appears in the string.

require "byebug"

def letter_count(string, char)
    debugger
    count = 0 # has to be 0 
    string.each_char do |c| 
        count += 1 if c.downcase == char # add == instead of =, make sure c is downcased in case we have capital letter  to make valid comparison
    end
    count
end

p letter_count("MISSIPPI", "i")