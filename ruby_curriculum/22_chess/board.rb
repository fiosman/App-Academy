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
    @rows.each_with_index do |row, row_pos| 
      row.each_index do |col_pos| 
        if row_pos == 0 
          spawn_back_row(row_pos, col_pos, :black)
        elsif row_pos == 7 
          spawn_back_row(row_pos, col_pos, :white)
        elsif row_pos == 1 
          spawn_front_row(row_pos, col_pos, :black)
        elsif row_pos == 6 
          spawn_front_row(row_pos, col_pos, :white)
        else
          @rows[row_pos][col_pos] = NullPiece.instance
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

  def spawn_back_row(row_pos, col_pos, color)
    case col_pos 
    when 0, 7
      @rows[row_pos][col_pos] = Rook.new(color, " R ")
    when 1, 6
      @rows[row_pos][col_pos] = Knight.new(color, " N ")
    when 2, 5
      @rows[row_pos][col_pos] = Bishop.new(color, " B ")
    when 3
      @rows[row_pos][col_pos] = Queen.new(color, " Q ")
    when 4
      @rows[row_pos][col_pos] = King.new(color, " K ")
    end
  end

  def spawn_front_row(row_pos, col_pos, color)
    case row_pos 
    when 1,6
      @rows[row_pos][col_pos] = Pawn.new(color, " P ")
    end
  end

end

# pp board_1 = Board.new
# board_1.move_piece([1,3], [5,4])
# #pp board_1.valid_pos?([1,3])
# pp board_1


