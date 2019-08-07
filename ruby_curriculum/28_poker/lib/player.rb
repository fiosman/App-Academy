require_relative 'deck'

class Player
  attr_reader :name, :hand, :id
  attr_accessor :chips 

  def initialize(name, hand)
    @chips = 100
    @name, @hand = name, hand 
    @id = { @name => [@hand, @chips] }
  end

end