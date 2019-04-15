class Player
  def initialize
    
  end

  # def prompt_pos 
  #   p "Please enter a position (e.g. 3,4)"
  # end

  def parse_pos 
    p "Please enter a position (e.g. 3,4)"
    response = gets.chomp

    response.split(",").map { |pos| Integer(pos) }
    #prompt_pos.split.length
    #new_arr 
  end
end

player_1 = Player.new
#p player_1.prompt_pos
