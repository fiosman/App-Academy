require_relative 'polytreenode'

class KnightPathFinder

  #There are 8 moves a Knight piece can make on a chess board.. L-Shaped (two moves horizontal, one move vertical. Or two moves vertical, one move horizontal)
  MOVES = [[1,2], [2,1], [-1, 2], [1, -2], [-2, 1], [2, -1], [-2, -1], [-1, -2]]

  def self.valid_moves(pos)
    #A move is valid if it is not out of the chessboard range(i.e. between 0 and 7)
    #We want to be abel to find new positions we can move to from a given position
    row, col = pos

    new_moves = MOVES.map do |move| 
      if (row + move.first).between?(0, 7) && (col + move.last).between?(0, 7)
        [row + move.first, col + move.last]
      end
    end
    new_moves.reject(&:nil?)
  end

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    #build_move_tree
    @considered_positions = [start_pos]
  end

  def new_move_positions(pos)
    #call valid_moves, filter out any positions that are already in considered positions
    #Add the remaining new positions to considered posns and return them 
  end
  
end

kpf = KnightPathFinder.new([0,1])
p KnightPathFinder.valid_moves([1,2])