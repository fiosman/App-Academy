class Player
  
  def parse_pos 
    p "Please enter a position (e.g. 3,4)"
    response = gets.chomp

    response.split(",").map { |pos| Integer(pos) } 
  end

  def prompt_flag 
    p "Would you like to flag this position as a mine? (Y/N)"
    response = gets.chomp.downcase 
  end

end

