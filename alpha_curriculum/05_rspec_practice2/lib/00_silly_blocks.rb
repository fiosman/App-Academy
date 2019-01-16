def reverser(&prc)
  string = prc.call
  arr = string.split(" ").map { |ele| ele.reverse}.join(" ")
end

def adder (number_to_add = 1, &prc)
  result = prc.call + number_to_add
end

def repeater (num_of_times = 1, &prc) 
  num_of_times.times do 
    prc.call 
  end
end

