require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos=nil)
    @board = board
    @next_mover_mark = next_mover_mark 
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over? 
      return false if @board.winner.nil? || @board.winner == evaluator
      return true
    end

    if @next_mover_mark == evaluator 
      self.children.all? { |child| child.losing_node?(evaluator) }
    else 
      self.children.any? { |child| child.losing_node?(evaluator) }
    end

  end

  def winning_node?(evaluator)
    if @board.over? 
      return true if @board.winner == evaluator 
      return false 
    end

    if @next_mover_mark == evaluator 
      self.children.any? { |child| child.winning_node?(evaluator)}
    else
      self.children.all? { |child| child.winning_node?(evaluator)}
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = []

    self.get_empty_posns.each do |posn| 
      updated_board = @board.dup
      updated_board[posn] = @next_mover_mark
      next_mark = @next_mover_mark == :x ? :o : :x
      new_node = TicTacToeNode.new(updated_board, next_mark, posn) 
      nodes << new_node
    end

    nodes
  end

  #Helper method to return all empty positions on the board
  def get_empty_posns 
    empty_posns = []

    @board.rows.each_with_index do |row, idx1| 
      row.each_with_index do |block, idx2| 
        if @board.empty?([idx1, idx2])
          empty_posns << [idx1, idx2]
        end
      end
    end

    empty_posns
  end

end
