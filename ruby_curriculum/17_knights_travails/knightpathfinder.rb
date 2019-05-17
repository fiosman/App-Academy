require_relative 'polytreenode'

class KnightPathFinder

  attr_accessor :root_node, :considered_positions

  MOVES = [[1,2], [2,1], [-1, 2], [1, -2], [-2, 1], [2, -1], [-2, -1], [-1, -2]]

  def self.valid_moves(pos)
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
    new_positions = KnightPathFinder.valid_moves(pos).select { |position| !@considered_positions.include?(position) }
    @considered_positions += new_positions
    return new_positions
  end

  def build_move_tree
    queue = [@root_node]

    until queue.empty? 
      current_node = queue.shift
      new_move_positions(current_node.value).each do |new_position| 
        child = PolyTreeNode.new(new_position)
        current_node.add_child(child)
        queue << child
      end
    end
  end
  
  def find_path(end_pos)
    end_node = @root_node.dfs(end_pos)
    trace_path_back(end_node)
  end

 def trace_path_back(end_node)
    path_nodes = []

    current_node = end_node
    until current_node.nil?
      path_nodes << current_node.value
      current_node = current_node.parent
    end

    path_nodes.reverse
  end
end

if __FILE__ == $PROGRAM_NAME
  kpf = KnightPathFinder.new([0, 0])
  p kpf.find_path([7, 6])
end



  
