# Debug this code to pass rspec! There are 1 mistake to fix.

# Write a method, half_and_double, that accepts an array of numbers as an arg. 
# The method should return a new array where every even number is divided by 2 and every odd
# number is multipled by 2.

require "byebug"

def half_and_double(array)
    debugger
    new_array = array.map do |num|
        if num % 2 == 0
            num / 2 #remove explicit return statement
        else
            num * 2 #remove explicit return statement
        end
    end

    new_array
end

p half_and_double([4, 5, 7,10])