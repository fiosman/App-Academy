def partition(array, num)
  new_arr = []
  
  new_arr << array.select { |ele| ele < num }
  new_arr << array.select { |ele| ele >= num }

  new_arr
end

def merge(hash_1, hash_2)
  new_hash = {}

  hash_1.each { |k, v| new_hash[k] = v }
  hash_2.each { |k, v| new_hash[k] = v }

  new_hash
end

def censor(sentence, array)
  split_sen = sentence.split(" ")
  vowels = "aeiou"
  
  split_sen.each do |ele| 
    if array.include?(ele.downcase)
      ele.each_char.with_index do |char, idx| 
        if vowels.include?(char.downcase)
          ele[idx] = "*"
        end
      end
    end
  end
  split_sen.join(" ")
end

def power_of_two?(num)
  return Math.log2(num).ceil == Math.log2(num).floor
end




