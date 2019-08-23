require_relative "my_stack"

class MinMaxStack

  def initialize
    @store = MyStack.new
  end

  def size 
    @store.size
  end

  def empty?
    @store.empty? 
  end

  def peek 
    @store.peek
  end

  def min
    @store.min_val
  end

  def max 
    @store.max_val
  end

  def pop 
    @store.pop
  end

  def push(ele)
    @store.push(ele)
  end

end