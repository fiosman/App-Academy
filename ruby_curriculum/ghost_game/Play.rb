require_relative "Game"

puts "Please enter the number of participants"
number_of_players = gets.chomp.to_i
players = []
until players.length == number_of_players
  puts "Player #{players.length + 1}, what is your name?"
  name = gets.chomp.capitalize
  if players.each.none? { |player| player.name == name }
    players << Player.new(name)
  else puts "Please enter a name that hasn't been taken"
  end
end
system('clear')

new_game = Game.new(players)
new_game.run
