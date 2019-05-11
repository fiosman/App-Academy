class Map

  attr_accessor :ivar 

  def initialize
    @ivar = []
  end

  def get(key)
    #get the value of a key, iterate through the array and see if key matches, return value
    @ivar.each { |sub_arr| return sub_arr.last if sub_arr.first == key }
  end

  def set(key, value)
    #first search if the key exists, replace value with new value. Otherwise make new key value pair
    @ivar.each do |sub_arr| 
      if sub_arr[0] == key 
       return sub_arr[-1] = value
      end
    end
    @ivar << [key, value]
  end

  def delete(key)
    @ivar.each_with_index { |sub_arr, idx| @ivar.delete_at(idx) if sub_arr.first == key } 
  end

  def show 
    @ivar.dup
  end

end
