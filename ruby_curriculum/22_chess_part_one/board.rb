require_relative 'pieces'
require_relative 'exceptions'

class Board
  attr_reader :rows 

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    populate_board
  end

  def move_piece(start_pos, end_pos) 
    if self[start_pos].is_a?(NullPiece)
      raise NoPieceError.new 'Hey there is no piece here!'
    elsif !self[end_pos].is_a?(NullPiece)
      raise InvalidMoveError.new 'You cannot move to this position!'
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
  end

  def populate_board 
    @rows.each_with_index do |row, row_idx| 
      row.each_index do |col_idx| 
        if row_idx == 0 || row_idx == 7
         spawn_back_row(col_idx, row_idx)
        elsif row_idx == 1 || row_idx == 6
         spawn_front_row(row_idx)
        else 
          @rows[row_idx][col_idx] = NullPiece.new
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, value)
    row, col = pos 
    @rows[row][col] = value
  end

  def valid_pos?(pos)
    row, col = pos 
    row.between?(0,7) && col.between?(0,7)
  end

  def spawn_back_row(col_pos, row_pos)
    case col_pos 
    when 0, 7
      @rows[row_pos][col_pos] = Rook.new
    when 1, 6
      @rows[row_pos][col_pos] = Knight.new
    when 2, 5
      @rows[row_pos][col_pos] = Bishop.new
    when 3
      @rows[row_pos][col_pos] = Queen.new
    when 4
      @rows[row_pos][col_pos] = King.new
    end
  end

  def spawn_front_row(row_pos)
    8.times do |col| 
      @rows[row_pos][col] = Pawn.new
    end
  end

end

#pp board_1 = Board.new
#board_1.move_piece([1,4], [3,1])
#pp board_1.valid_pos?([1,3])


