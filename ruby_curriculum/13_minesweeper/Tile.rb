class Tile

  attr_accessor :value
  def initialize(value)
    @value = value
    @bomb = true 
    @revealed = true
  end

  def status? 
     if self.value == 1 
       @bomb = true 
       @revealed = false 
     else 
      @bomb = false 
      @revealed = true
    end
  end
end