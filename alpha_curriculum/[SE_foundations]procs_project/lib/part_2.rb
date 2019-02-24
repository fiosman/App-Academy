def reverser(string, &prc)
  prc.call(string.reverse)
end

def word_changer(sentence, &prc)
  new_sentence = []

  sentence.split(" ").each do |word| 
    new_sentence << prc.call(word)
  end
  new_sentence.join(" ")
end

def greater_proc_value(num, prc1, prc2)
  prc1.call(num) > prc2.call(num) ? prc1.call(num) : prc2.call(num)
end

def and_selector(arr, prc1, prc2)
  valid = []

  arr.each { |ele| valid << ele if prc1.call(ele) && prc2.call(ele) }
  valid
end

def alternating_mapper(array, prc1, prc2)
  new_array = []

  array.each_with_index do |ele, idx| 
    idx.even? ? new_array << prc1.call(ele) : new_array << prc2.call(ele)
  end
  new_array
end

