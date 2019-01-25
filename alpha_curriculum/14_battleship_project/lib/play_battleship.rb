# No need to change or write any code in this file.
#
# After you complete all specs, you can play your game by
# running this file with `ruby lib/play_battleship.rb` in your terminal!

require_relative "battleship"

puts "Enter a size for the game: "
battleship = Battleship.new(gets.chomp.to_i)
battleship.start_game

until battleship.game_over? do
  puts "-------------------------"
  battleship.turn
end
