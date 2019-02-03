require_relative 'player'

class Game
  attr_reader :player 
  def initialize(player)
    @player = player
  end

  def play_round
    @player.guess
    @player.compare_guesses
  end

  def play
    play_round until @player.win 
  end

end

game_1 = Game.new(Player.new)
game_1.play