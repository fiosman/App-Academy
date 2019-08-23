require_relative 'my_stack'

class StackQueue

  def initialize
    @inbox = MyStack.new
    @outbox = MyStack.new
  end

  def size 
    @inbox.size + @outbox.size
  end

  def empty? 
    @inbox.empty? && @outbox.empty?
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

end