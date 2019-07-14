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
      else
        set << current_num
      end
    end
    sum_pairs.sort { |a,b| a <=> b }
  end

  def my_transpose 
    self.length.times do |i|
      (i..self.length-1).each do |j|
        self[i][j], self[j][i] = self[j][i], self[i][j]
      end
    end
    self
  end  

  def stock_picker 
  end

end



