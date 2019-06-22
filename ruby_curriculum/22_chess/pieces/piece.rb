class Piece
  attr_reader :val 

  def initialize
    @val = rand(0..9)
  end
end

#piece_1 = Piece.new
