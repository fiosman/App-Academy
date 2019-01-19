# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
  def span 
    if self.empty?
      nil
    else
      self.max - self.min 
    end
  end

  def average
    if self.empty?
      nil
    else
      self.reduce(:+).to_f/self.count
    end
  end

  def median 
    if self.empty? 
      return nil 
    end
    self.sort!
    if self.length.odd? 
      return self[self.length/2.0].ceil
    elsif self.length.even? 
      return (self[self.length/2.0].to_f + self[self.length/2.0 - 1].to_f)/2 
    end
  end

  def counts 
   count_hash = Hash.new(0)
   self.each do |ele|
    count_hash[ele] += 1
   end
    count_hash
  end

  def my_count(val)
    count_hash = Hash.new(0)
    self.each do |ele| 
      count_hash[ele] += 1
    end
    count_hash[val]
  end

  def my_index(val)
    self.each_with_index do |ele, idx| 
      if val === ele 
        return idx
      end
    end
    nil
  end

  def my_uniq
    hsh = {}
    self.each do |ele| 
      hsh[ele] = ele
    end
    hsh.keys
  end

  def my_transpose 
    new_arr = []
    (0...self.length).each do |outer_el| 
      outer_arr = []
      (0...self.length).each do |inner_el| 
        outer_arr << self[inner_el][outer_el]
      end
      new_arr << outer_arr
    end
    new_arr
  end
end




