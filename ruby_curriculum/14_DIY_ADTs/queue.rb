class Queue
  
  attr_accessor :ivar 

  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar.push(el)
  end

  def dequeue
    @ivar.shift
  end

  def peek
    @ivar.dup
  end

end

