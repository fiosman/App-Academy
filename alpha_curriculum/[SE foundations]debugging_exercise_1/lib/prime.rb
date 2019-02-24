# Debug this code to pass rspec! There are 2 mistakes to fix.

# Write a method, prime?, that accepts a number. It should return a boolean indicating whether or not the given number 
# is a prime. A prime number is only divisible by 1 and itself, it should have no other divisors.

require "byebug"

def prime?(num) #wrong method name - should be prime? according to RSpec
    
    debugger
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    true #Originally, an explicit return statement was placed in the else block of the if statement above. This caused the program to terminate early and incorrectly return true. We should only return true after the execution of the ENTIRE loop. 
end

p prime?(9)