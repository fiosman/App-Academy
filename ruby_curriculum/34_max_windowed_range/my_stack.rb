class MyStack

  def initialize
    @store = []
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
  end
  
  def push(ele)
    @store.push(ele)
  end

end