class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end
  
end