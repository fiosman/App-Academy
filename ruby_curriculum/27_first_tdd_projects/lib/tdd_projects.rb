#require 'byebug'

class Array 
  
  def my_uniq 
    uniq_arr = []
    self.each { |ele| uniq_arr << ele unless uniq_arr.include?(ele) }
    uniq_arr
  end

  def two_sum
  end

  def my_transpose 
  end

  def stock_picker 
  end

end

