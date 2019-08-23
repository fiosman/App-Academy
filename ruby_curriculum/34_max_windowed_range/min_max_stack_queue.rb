require_relative "stackqueue"

class MinMaxStackQueue
  
  def initialize
    @inbox = MinMaxStack.new
    @outbox = MinMaxStack.new
  end

  def size 
    @inbox.size + @outbox.size
  end

  def empty? 
    @inbox.empty? && @outbox.empty?? 
  end

  def enqueue(ele)
    @inbox.push(ele)
  end

  def dequeue
    if @outbox.empty? 
      @outbox.push(@inbox.pop) until @inbox.empty?  
    end

    @outbox.pop
  end

  def max_ele 
    max_arr = []
    max_arr << @inbox.max_val unless @inbox.empty? 
    max_arr << @outbox.max_val unless @outbox.empty? 
    max_arr.max 
  end

  def min_ele 
    min_arr = []
    min_arr << @inbox.min_val unless @inbox.empty? 
    min_arr << @outbox.min_val unless @outbox.empty?
    min_arr.min
  end

end