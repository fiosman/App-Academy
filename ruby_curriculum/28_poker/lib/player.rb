require_relative 'deck'
require_relative 'game'
require_relative 'hand'

class Player
  attr_reader :name, :hand
  attr_accessor :chips 

  def initialize(name)
    @chips = 100
    @name, @hand = name, Hand.new
  end

  def pay_ante(pot, ante)
    pot += ante
    p "The pot is now #{pot}"
    self.chips -= ante
    p "You now have #{self.chips}"
  end
end