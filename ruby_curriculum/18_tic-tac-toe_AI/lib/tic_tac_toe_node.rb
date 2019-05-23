require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos=nil)
    @board = board
    @next_mover_mark = next_mover_mark 
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = []

    @board.rows.each_with_index do |row, idx1| 
      row.each_with_index do |block, idx2| 
        if block.nil? 
          updated_board = @board.rows.dup
          updated_board[idx1][idx2] = @next_mover_mark
          next_mark = @next_mover_mark == :x ? :o : :x
          new_node = TicTacToeNode.new(updated_board, next_mark, [idx1,idx2]) 
          nodes << new_node
        end
      end
    end
    
    nodes
  end

end

