class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next 
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable 

  attr_accessor :head, :tail 

  def initialize
    @head = Node.new
    @tail = Node.new     
    @head.next = @tail 
    @tail.prev = @head    
  end

  def [](i)
    self.each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self.head.next 
  end

  def last
    self.tail.prev
  end

  def empty?
    self.head.next == self.tail
  end

  def get(key)
    self.each { |node| return node.val if node.key == key }
    nil 
  end

  def include?(key)
    self.each { |node| return true if node.key == key }
    false 
  end

  def append(key, val)
    new_node = Node.new(key, val)
    self.tail.prev.next = new_node
    new_node.prev = self.tail.prev
    new_node.next = self.tail
    self.tail.prev = new_node
    
    new_node 
  end

  def update(key, val)
    self.each do |node| 
      if node.key == key 
        node.val = val 
      end
    end

    nil
  end

  def remove(key)
    self.each do |node| 
      if node.key == key 
        node.remove 
      end
    end
  end

  def each(&prc)
    node = self.head.next

    until node == self.tail 
      prc.call(node)
      node = node.next  
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
