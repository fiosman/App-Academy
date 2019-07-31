require_relative 'card'

class Deck
  attr_reader :deck 

  def initialize
    @deck = Array.new(5) { Card.new }
  end

end
