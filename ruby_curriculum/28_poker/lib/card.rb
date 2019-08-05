class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def stringify 
    "#{@rank} of #{suit}"
  end

end