class Game 
  attr_reader :towers

  def initialize(towers = [[3,2,1], [], []])
    @towers = towers  
  end

  def won? 
    return true if @towers[1] == [3,2,1] || @towers[2] == [3,2,1] 
    false
  end

  def move(start_pos, end_pos)
    @towers[end_pos] << @towers[start_pos].pop 
  end

  def play
    until won? 
      
    end
  end

  def render 
    @towers.each_with_index do |tower, idx| 
      print "Tower #{idx+1} : #{tower.join(' ')} \n"
    end
  end

end