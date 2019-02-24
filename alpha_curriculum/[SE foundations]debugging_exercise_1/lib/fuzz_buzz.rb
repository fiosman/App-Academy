# Debug this code to pass rspec! There is 1 mistake to fix.

# Write a method, fuzz_buzz, that accepts a number as an arg. 
# The method should return an array of numbers from one to the given number that are not divisible by 3 or 5.

require "byebug"

def fuzz_buzz(num)
    numbers = []

    debugger
    (1..num).each do |i|
        if i % 3 != 0 && i % 5 != 0 ## add && operator so both conditions can be evaluated to true 
            numbers << i
        end
    end

    numbers
end

p fuzz_buzz(11)
