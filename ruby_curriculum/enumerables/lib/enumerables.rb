require 'byebug'

class Array

  def my_each(&prc)
    i = 0 
    while i < self.length 
      prc.call(self[i])
      i+=1
    end
    self
  end

  def my_select(&prc)
    arr = []
    self.my_each { |ele| arr << ele if prc.call(ele) == true }
    arr
  end

  def my_map(&prc)
    arr = []
    self.my_each { |ele| arr << prc.call(ele) }
    arr
  end

  def my_reject(&prc)
    arr = []
    self.my_each { |ele| arr << ele if prc.call(ele) == false }
    arr
  end

  def my_any?(&prc)
    self.my_each do |ele| 
      if prc.call(ele) == true
        return true 
      end
    end
    return false
  end

  def my_all?(&prc)
    self.my_each do |ele| 
      if prc.call(ele) == false
        return false
      end
    end
    return true
  end

  def my_zip(*args)
    arr = []
    self.length.times do |idx| 
      sub_arr = Array.new(1, self[idx])
      
      args.my_each do |ele| 
        sub_arr << ele[idx]
      end

       arr << sub_arr
    end

     arr
  end

  def my_join(string_separator="")
    str = ""
    (0...self.length).each do |idx|
      str += self[idx].to_s 
      str+= string_separator unless idx == self.length - 1
    end
    str
  end

  def my_reverse
    reversed_arr = []
    i = self.length - 1

    while i >= 0 
      reversed_arr << self[i]
      i-=1
    end
   p reversed_arr
  end

  def my_rotate(pos=1)
    if pos.negative? 
      p  (self.reverse.drop(pos.abs) + self.reverse.take(pos.abs)).reverse 
    else 
      p self.drop(pos) + self.take(pos) 
    end
  end

  def my_flatten
    flattened_arr = []
    self.each do |ele| 
      if ele.is_a?(Array)
        flattened_arr += ele.my_flatten
      else
        flattened_arr << ele
      end
    end
    flattened_arr
  end
end








 








