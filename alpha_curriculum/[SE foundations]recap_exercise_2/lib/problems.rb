# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    multiple = num_1 

    factor = 1
    while true 
        multiple = num_1 * factor
        factor += 1
        return multiple if multiple % num_2 == 0 
    end
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    arr = []
    hsh = Hash.new(0)

    (0...str.length-1).each do |idx| 
        arr << str[idx..idx+1]
    end
    arr.each do |ele| 
       hsh[ele] += 1 
    end
    hsh.sort_by { |k,v| v }.last.first
end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hsh = {}
        self.each do |k,v|
            hsh[v] = k 
        end
        hsh
    end
end

class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pair_sum_arr = []
        (0...self.length-1).each do |idx1|
            (idx1...self.length - 1).each do |idx2|
                left_val = self[idx1]
                right_val = self[idx2 + 1]
                pair_sum_arr << [left_val, right_val] if left_val + right_val == num
            end
        end
        pair_sum_arr.count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)

    end
end
