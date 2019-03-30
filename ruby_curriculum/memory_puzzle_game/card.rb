class Card
  
  attr_reader :hidden_value, :revealed_value
  attr_accessor :face_up

  def initialize(letter, number)
    @revealed_value = letter
    @face_up = false
    @hidden_value = number
  end

  def value? 
    self.face_up == true ? self.revealed_value : self.hidden_value 
  end

  def hide 
    @face_up = false
  end

  def reveal 
    @face_up = true
  end

end

