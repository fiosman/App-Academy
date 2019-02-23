# Write a method, replace_char_at!(str, char, idx), that accepts a string, character, and an index as arguments. 
# The method should mutate the str by replacing the given idx of the str with the char. The method
# should return the str.
# 
# Note: this method must MUTATE the input str. This means that the object_id of the input string should be identical
# to the object_id of the returned string. The exact object_ids you get back don't matter. We just want the ids
# to be the same before and after calling your method.

def replace_char_at!(str, char, idx)
  str[idx] = char
  str
end

str_1 = "hello"
p str_1.object_id                       # => 70120944788380
result_1 = replace_char_at!(str_1, "j", 0)
p result_1                              # => "jello"
p result_1.object_id                    # => 70120944788380


str_2 = "world"
p str_2.object_id                       # => 70120944769940
result_2 = replace_char_at!(str_2, "!", 2) 
p result_2                              # => "wo!ld"
p result_2.object_id                    # => 70120944769940
