require_relative 'Board.rb'
require_relative 'Player.rb'

class Game
  def initialize
    @player = Player.new
    @board = Board.new(9)
  end

  def run
    play until game_over?
  end

  def game_over? 

  end

  def play 

  end

end