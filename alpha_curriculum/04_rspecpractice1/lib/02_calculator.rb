def add (num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(arr)
  sum = 0
  arr.each { |ele| sum+= ele }
  return sum
end

def multiply(arr) 
  product = 1
  arr.each { |ele| product*= ele }
  return product
end

def power(num, num2)
  num ** num2
end

def factorial(num)
  if num == 0 
    return 1 
  end

  product = 1
  (1..num).each do |ele| 
    product *= ele
  end
  return product
end


