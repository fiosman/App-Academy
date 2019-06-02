require_relative 'Piece.rb'

class Board
  def initialize
    @rows = Array.new(8) { Array.new (8) }
    populate_board
  end

  def move_piece(start_pos, end_pos)

  end

  def populate_board 
    @rows.each_with_index do |row, row_idx| 
      row.each_index do |col_idx| 
        @rows[row_idx][col_idx] = Piece.new
      end
    end

    @rows
  end

  
end

#board_1 = Board.new 



