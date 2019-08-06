require_relative 'deck'

class Player
  attr_reader :name
  attr_accessor :chips 

  def initialize(name)
    @chips = 100
    @name = name
  end

end