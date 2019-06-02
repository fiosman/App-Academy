require_relative 'piece.rb'

class Board
  def initialize
    @rows = Array.new(8) { Array.new (8) }
    #populate_board
  end

  def move_piece(start_pos, end_pos)

  end

  def populate_board 
    @rows.each do |row| 
      row.each do |col| 
        col = Piece.new
      end
    end
    
    @rows
  end

  def [](pos)

  end

  def pos=(pos, val)

  end
end


