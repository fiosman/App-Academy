require_relative 'Piece.rb'

class Board
  def initialize
    @rows = Array.new(8) { Array.new (8) }
    populate_board
  end

  def move_piece(start_pos, end_pos)
    unless self[start_pos].nil? || !self[end_pos].nil? 
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
  end

  def populate_board 
    @rows.each_with_index do |row, row_idx| 
      row.each_index do |col_idx| 
        @rows[row_idx][col_idx] = Piece.new
      end
    end

    @rows
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, value)
    row, col = pos 
    @rows[row][col] = value
  end

end

# pp board_1 = Board.new 
# board_1.move_piece([0, 0], [0,1])
# pp board_1



