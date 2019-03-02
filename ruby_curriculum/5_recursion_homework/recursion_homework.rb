def sum_to(n)
  return n if n == 1
  sum_to(n-1) + n 
end

def add_numbers(nums_array)
  return nums_array.first if nums_array.length <= 1
  nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma_function(n)
  return nil if n < 1
  return 1 if n == 1  
  gamma_function(n-1) * (n-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty? 
  return true if flavors.shift == favorite
  ice_cream_shop(flavors, favorite)
end

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0..-2]) 
end


