class Game 
  attr_reader :towers

  def initialize(towers = [[3,2,1], [], []])
    @towers = towers  
  end

  def won? 

  end

  def move(start_pos, end_pos)
    @towers[end_pos] << @towers[start_pos].pop 
  end

  def play
    
  end

  def render 

  end

end