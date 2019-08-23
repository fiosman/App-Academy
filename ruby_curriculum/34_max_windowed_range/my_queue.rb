class MyQueue

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

  #first in, first out.. 
  def enqueue(ele)
    @store.push(ele)
  end

  #first in, first out..
  def dequeue
    @store.shift #O(n) time operation => Indices of elements have to be re-assigned in the array. 
  end

end