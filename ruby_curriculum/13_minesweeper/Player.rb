class Player
  
  def parse_pos 
    p "Please enter a position (e.g. 3,4)"
    response = gets.chomp

    response.split(",").map { |pos| Integer(pos) } 
  end

end

