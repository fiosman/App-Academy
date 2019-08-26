class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    res = 0
    self.each_with_index do |ele, idx|
      res += ele.hash ^ idx 
    end
    
    res.hash
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a 
    integer_string = ""
    self.downcase.each_char do |char| 
      integer_string += alphabet.index(char).to_s
    end
    
    integer_string.to_i.hash
  end
end

class Hash
  def hash
    res = 0 
    self.to_a.flatten.each do |ele| 
      res += ele.hash
    end

    res
  end
end
