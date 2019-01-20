class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word 
    DICTIONARY.sample
  end
  
  def initialize()
   random_word =  Hangman.random_word 
   @secret_word = random_word
   @guess_word = Array.new(@secret_word.length,"_")
   @attempted_chars = []
   @remaining_incorrect_guesses = 5
  end

  def secret_word 
    @secret_word
  end

  def guess_word 
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      true
    else
      false
    end
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |letter, idx| 
      arr << idx if letter === char
    end
    arr
  end
  
  def fill_indices(char, arr)
    @guess_word.each_index do |idx| 
      if arr.include?(idx)
        @guess_word[idx] = char
      end
    end
    @guess_word
  end

  def try_guess(char)
   if self.already_attempted?(char)
    puts 'that has already been attempted'
    return false
   end

   @attempted_chars << char
  
    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)
    @remaining_incorrect_guesses -= 1 if matches.empty?
    true
  end

  def ask_user_for_guess
    p 'Enter a char:'
    response = gets.chomp
    try_guess(response)
  end

  def win? 
    if @guess_word.join("") == @secret_word 
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose? 
    if remaining_incorrect_guesses == 0 
      p 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over? 
    if self.win? || self.lose? 
      p "#{secret_word}"
      return true
    end
    return false
  end
end


