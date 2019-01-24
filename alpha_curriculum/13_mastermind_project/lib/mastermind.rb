require_relative "code"

class Mastermind

  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code_instance)
   p "Exact matches: #{@secret_code.num_exact_matches(code_instance)}"
   p "Near matches: #{@secret_code.num_near_matches(code_instance)}"
  end

  def ask_user_for_guess
    p 'Enter a code'
    response = gets.chomp
    user_code = Code.from_string(response)
    self.print_matches(user_code)
    @secret_code == user_code
  end
end

