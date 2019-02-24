def my_map(array, &prc)
  new_arr = []

  array.each { |ele| new_arr << prc.call(ele) }
  new_arr
end

def my_select(array, &prc)
  new_arr = []

  array.each { |ele| new_arr << ele if prc.call(ele) }
  new_arr
end

def my_count(array, &prc)
  count = 0 

  array.each { |ele| count+=1 if prc.call(ele) }
  count
end

def my_any?(array, &prc)
  array.each do |ele| 
    return true if prc.call(ele) 
  end
  false
end

def my_all?(array, &prc)
  array.each do |ele| 
    return false if !prc.call(ele)
  end
  true
end

def my_none?(array, &prc)
  array.each do |ele| 
    return false if prc.call(ele)
  end
  true
end