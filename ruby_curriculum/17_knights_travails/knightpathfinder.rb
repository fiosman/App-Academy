require_relative 'polytreenode'

class KnightPathFinder

  def self.valid_moves(pos)

  end

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    build_move_tree
    @considered_positions = [start_pos]
  end

  def new_move_positions(pos)
    #call valid_moves, filter out any positions that are already in considered positions
    #Add the remaining new positions to considered posns and return them 
  end
  
end