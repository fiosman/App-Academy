# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  new_arr = str.split(" ")
  hsh = {}
  new_arr.each do |ele|
    hsh[ele] = ele.length 
  end
  hsh
end


# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.sort_by { |k, v| v}[-1][0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  #update older inventory with new values 
  #add new key-value pairs to older inventory
  newer.each do |k, v| 
    if !older.has_key?(k)
      older[k] = v
    elsif older.has_key?(k)
      older[k] = v
    end
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  letter_counts = Hash.new(0)

  word.split("").each do |ele| 
    letter_counts[ele] += 1
  end
  letter_counts
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  #make hash with each item in teh array as a key, and the value will be its frequency
  new_arr = []
  freqhash = Hash.new(0)
  arr.each do |ele| 
    freqhash[ele] += 1
  end
  
  freqhash.each do |k, v| 
      new_arr << k
  end
  
  new_arr
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  even_odds_hash = Hash.new(0)
  
  numbers.each do |ele| 
    if ele.even? 
      even_odds_hash[:even] += 1
    else
      even_odds_hash[:odd] += 1
    end
  end
  even_odds_hash
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are 
# lower case.
def most_common_vowel(string)
  vowels = "aeiou"
  common_vowels = Hash.new(0)

  string.each_char do |char| 
    if vowels.include?(char)
      common_vowels[char] += 1
    end
  end
  
  sorted_vowels = common_vowels.sort_by { |k, v| k}
  if sorted_vowels[0][0] < sorted_vowels[1][0] && sorted_vowels[0][1] == sorted_vowels[1][1]
    return sorted_vowels[0][0]
  end
  sorted_vowels[1][0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  second_half_students = students.select! do |k,v| 
    v > 6 && v <= 12
    end
    students_arr = second_half_students.keys
    new_arr = []

    students_arr.each_index do |idx1|
      (idx1+1...students_arr.length).each do |idx2| 
        new_arr << [students_arr[idx1], students_arr[idx2]] 
      end
    end
    new_arr
end

#students_arr = [Bertie, Dottie, Warren]
#p fall_and_winter_birthdays({ "Asher" => 6, "Bertie" => 11,"Dottie" => 8, "Warren" => 9 })



# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  #biodiversity index = number_of_species**2 *(smallest_pop_size/largest_pop_size)
  #population size is the number of times a species appears in the array
  num_species = specimens.uniq.length 
  hash_count = Hash.new(0)

  specimens.each do |ele| 
    hash_count[ele] += 1
  end
    sorted_arr = hash_count.sort_by { |k,v| v}
    largest_pop = sorted_arr.last.last 
    smallest_pop = sorted_arr.first.last
    return (num_species**2*(smallest_pop.to_f/largest_pop.to_f)).to_i
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_sign_hsh = Hash.new(0)
  van_sign_arr = vandalized_sign.split("")
  normal_sign.each_char do |char| 
    normal_sign_hsh[char.downcase] += 1
  end

  van_sign_arr.all? do |char| 
    normal_sign_hsh.include?(char.downcase)
  end
end



