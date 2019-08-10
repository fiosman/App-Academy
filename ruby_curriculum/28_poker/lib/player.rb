require_relative 'deck'

class Player
  attr_reader :name, :hand
  attr_accessor :chips 

  def initialize(name, hand=nil)
    @chips = 100
    @name, @hand = name, hand 
  end

end