require_relative 'deck'

class Player
  attr_reader :name, :hand
  attr_accessor :chips 

  def initialize(name, hand)
    @chips = 100
    @name, @hand = name, hand 
  end

  def generate_ID 
    { @name => [@hand, @chips] }
  end

end