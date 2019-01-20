# No need to change or write any code in this file.
#
# After you complete all specs, you can simulate your hotel by
# running this file with `ruby lib/play_hangman.rb` in your terminal!

require_relative "hangman"

hangman = Hangman.new

until hangman.game_over?
  puts "Incorrect Guesses Remaining: #{hangman.remaining_incorrect_guesses}"
  puts "Attempted Chars: #{hangman.attempted_chars}"
  puts "Word: #{hangman.guess_word}"
  print "\n" until hangman.ask_user_for_guess
  print "\n\n"
end
