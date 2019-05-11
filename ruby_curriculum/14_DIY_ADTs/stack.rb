  class Stack

    attr_accessor :ivar

    def initialize
      @ivar = []
    end

    def push(el)
      @ivar.push(el)
    end

    def pop
      @ivar.pop
    end

    def peek
      @ivar.dup
    end
    
  end