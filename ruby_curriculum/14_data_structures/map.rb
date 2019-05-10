class Map

  attr_accessor :ivar 

  def initialize
    @ivar = [["Chris", 1]]
  end

  def get(key)
    #get the value of a key, iterate through the array and see if key matches, return value
    @ivar.each do |sub_arr| 
      if sub_arr.first == key 
        return sub_arr.last
      end
    end
  end

  def set(key, value)
    #first search if the key exists, replace value with new value. Otherwise make new key value pair
    @ivar.each do |sub_arr| 
      if sub_arr.include?(key)
        sub_arr.last = value 
      end
    end
    @ivar << [key, value]
  end

  def delete(key)

  end

  def show 

  end

end

map_1 = Map.new
#p map_1.get("Fares")
p map_1.ivar
map_1.set('Fares', 1)
p map_1.ivar
p map_1.get('Fares')