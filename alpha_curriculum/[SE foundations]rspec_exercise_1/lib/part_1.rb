def average(num_1, num_2)
  (num_1 + num_2)/2.to_f
end

def average_array(array)
  array.sum / (array.length.to_f)
end

def repeat(str, num)
  new_str = ""
  num.times do
    new_str+= str
  end
  new_str
end

def yell(str) 
  str.upcase + "!"
end

def alternating_case(sentence)
  sen_arr = sentence.split(" ")

  sen_arr.each_index do |idx| 
    if idx.even?
      sen_arr[idx].upcase!
    else
      sen_arr[idx].downcase!
    end
  end
  sen_arr.join(" ")
end
