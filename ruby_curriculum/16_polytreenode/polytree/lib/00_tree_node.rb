class PolyTreeNode

  def initialize(value)
    @value = value 
    @parent = nil 
    @children = [] 
  end

  def parent 
    @parent 
  end

  def children 
    @children
  end

  def value 
    @value 
  end

  def parent=(node)
    @parent.children.delete(self) if !@parent.nil?
    @parent = node
    node.children << self unless node.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil 
    raise error if !@children.include?(child_node)
  end

  def dfs(target_value)
    return self if target_value == self.value
  
    self.children.each do |child| 
      search = child.dfs(target_value)
      return search unless search.nil?
    end

    nil
  end
  
  def bfs(target_value)
    queue = [self]

    until queue.empty? 
      current_node = queue.shift
      return current_node if target_value == current_node
      current_node.children.each { |child| queue << child } 
    end

    nil
  end

end


