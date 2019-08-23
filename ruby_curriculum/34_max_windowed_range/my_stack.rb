class MyStack

  def initialize
    @store = []
    @max_stack = []
  end

  def peek
    @store[-1]
  end

  def size
    @store.size
  end

  def empty?
    @store.empty? 
  end

  def pop
    @store.pop
    @max_stack.pop
  end
  
  def push(ele)
    max = ele 
    
    if (!@max_stack.empty? && max < @max_stack[-1])
      max = @max_stack[-1]
    end

    @store.push(ele)
    @max_stack.push(max)
  end

  def max 
    @max_stack[-1]
  end

  def min 
    @max_stack[0]
  end

end