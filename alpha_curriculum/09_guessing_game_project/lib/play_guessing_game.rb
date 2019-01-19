# No need to change or write any code in this file.
#
# After you complete all specs, you can simulate your game by
# running this file with `ruby lib/play_guessing_game.rb` in your terminal!

require_relative "guessing_game"

print "Enter a min number: "
min = gets.chomp.to_i

print "Enter a max number: "
max = gets.chomp.to_i

puts "I'm thinking of a number between #{min} and #{max}"

guessing_game = GuessingGame.new(min, max)

until guessing_game.game_over?
  guessing_game.ask_user
  puts "---------------"
end

puts "You won in #{guessing_game.num_attempts} tries"
