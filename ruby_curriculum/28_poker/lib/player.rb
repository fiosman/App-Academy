require_relative 'deck'

class Player
  attr_reader :name, :hand
  attr_accessor :chips 

  def initialize(name)
    @chips = 100
    @name, @hand = name, [] 
  end

end