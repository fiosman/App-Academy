class Game 
  attr_reader :towers

  def initialize(towers = [[3,2,1], [], []])
    @towers = towers  
  end
end