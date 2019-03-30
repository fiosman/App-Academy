require 'set'
require_relative "Player"

class Game

  attr_reader :dictionary, :game_over
  attr_accessor :fragment, :players

  ALPHABET = Set.new("a".."z")
  GHOST = String.new("GHOST")
  MAX_LOSS = 5

  def initialize(*players)
    @fragment = ""
    @players = players.flatten
    @dictionary = Set.new(File.read("dictionary.txt").split("\n"))
    @player_losses = Hash.new(0)
  end

  def valid_play?(letter)
    if ALPHABET.include?(letter)
      temp_fragment = @fragment + letter
    else
      return false
    end
    word_check(temp_fragment)
  end

  def word_check(fragment)
    @dictionary.any? { |word| word.start_with?(fragment) }  
  end

  def add_letter(letter)
    @fragment << letter
  end

  def round_over? 
    @dictionary.include?(@fragment)
  end

  def five_losses
    @player_losses.values.any? { |losses| losses == MAX_LOSS }
  end

  def eliminate_player 
    #get ID of person with 5 losses
    player_to_eliminate = @player_losses.key(MAX_LOSS) 
    #if any player has any 5 losses...
    #pass that player's ID to delete from the players array and the hash that tracks # of losses
    if five_losses
       @players.delete(player_to_eliminate) 
       @player_losses.delete(player_to_eliminate)
    end
  end

  def game_over? 
    @players.length == 1
    #Game is over when there is only 1 player remaining in the game 
    #player gets eliminated when they spell out GHOST
  end

  def eliminate_msg
    if @player_losses.values.max == MAX_LOSS
      puts "#{@player_losses.key(MAX_LOSS).name} has been eliminated"
    end
  end

  def winner
    puts "#{@players.first.name} wins the game!"
  end

  def display_score
    @players.each do |player| 
      puts "#{ player.name } : #{ update_ghost(@player_losses[player])}"
    end
  end

  def play_round
    @fragment = ""
    display_score
    until round_over? 
      take_turn
      next_player!
    end
    update_loss
    eliminate_msg
    eliminate_player
  end
  
  def update_ghost(end_range)
    GHOST[0...end_range]
  end

  def update_loss
    @player_losses[previous_player] += 1
    unless @player_losses.values.max == MAX_LOSS
      puts "#{previous_player.name} : #{update_ghost(@player_losses[previous_player])}"
      system('clear')
    end
  end

  def run
    play_round until game_over?
    winner
  end

  def current_player
    @players.first
  end

  def previous_player 
    @players.last
  end

  def next_player! 
    @players.rotate!
  end

  def display_fragment
    p "Current fragment is: #{@fragment}"
  end

  def take_turn
    current_player.prompt_guess
    letter = current_player.guessed_letter
    if valid_play?(letter)
      self.add_letter(letter)
      display_fragment unless round_over?
    else
      current_player.alert_invalid_guess
      display_fragment
      take_turn
    end
  end
end
