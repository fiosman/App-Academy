require 'set'

class Array 
  
  def my_uniq 
    uniq_arr = []
    self.each { |ele| uniq_arr << ele unless uniq_arr.include?(ele) }
    uniq_arr
  end

  def two_sum    
    set = Set.new
    sum_pairs = []

    self.each do |current_num| 
      target_num = (0-current_num)
      if set.include?(target_num)
        sum_pairs << [self.index(target_num), self.index(current_num)]
      end
      set << current_num
    end
    sum_pairs
  end

  def my_transpose 
  end

  def stock_picker 
  end

end

arr = [-1, 0, 2, -2, 1]
p arr.two_sum
