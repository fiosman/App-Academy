class Player
  def initialize
    
  end

  def prompt_pos 
    p "Please enter a position (e.g. 3,4)"
    response = gets.chomp
  end

  def parse_pos 
    new_arr = prompt_pos.split(",").map { |pos| Integer(pos) }
    #prompt_pos.split.length
    #new_arr 
  end
end

player_1 = Player.new
#p player_1.prompt_pos
p player_1.parse_pos