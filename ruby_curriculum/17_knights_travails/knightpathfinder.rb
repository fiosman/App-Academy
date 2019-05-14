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
    @considered_positions = [start_pos]

    build_move_tree
  end

  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos).reject { |position| @considered_positions.include?(position) }
    @considered_positions << positions
    return new_moves
  end

  def build_move_tree
    queue = [self.root_node.value]

    until queue.empty? 
      current_pos = queue.shift
      new_move_positions(current_pos.value).each do |new_pos| 
        child = PolyTreeNode.new(new_pos)
        current_pos.add_child(child)
        queue << child
      end
    end
  end
  
  def find_path(end_pos)
    node = @root_node.dfs(end_pos)
    trace_path_back(node)
  end

  def trace_path_back(node)
    res = [node]

    
    
  end

end

kpf = KnightPathFinder.new([0,1])
#p KnightPathFinder.valid_moves([1,2])