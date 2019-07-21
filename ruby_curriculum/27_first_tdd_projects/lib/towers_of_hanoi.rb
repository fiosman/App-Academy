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

  def valid_move?(start_pos, end_pos)
    return true if @towers[end_pos].empty? 
    return false if @towers[start_pos].empty? 
    @towers[end_pos].last > @towers[start_pos].pop ? true : false
  end

  def play
    system('clear')
    self.render
    until self.won? 
      puts 'Please enter a Tower from which to pick a disk to move (e.g. 0)'
      move_res = gets.chomp.to_i
      puts 'Please enter a Tower to place the disk you just picked (e.g. 1)'
      place_res = gets.chomp.to_i 
      self.move(move_res, place_res)
      self.render
    end
    puts 'Congratulations, you win!'
  end

  def render
    @towers.each_with_index do |tower, idx| 
      print "Tower #{idx} : #{tower.join(' ')} \n"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new 
  game.play 
end