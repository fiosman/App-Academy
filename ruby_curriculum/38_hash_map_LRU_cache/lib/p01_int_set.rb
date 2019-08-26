require 'byebug'

class MaxIntSet
  attr_reader :store
  
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num) 
      self.store[num] = true
    else
      validate!(num)
    end
  end

  def remove(num)
    self.store[num] = false 
  end

  def include?(num)
    self.store[num] == true
  end

  private

  def is_valid?(num)
    num.between?(0, self.store.length - 1)
  end

  def validate!(num)
    raise "Out of bounds" if !is_valid?(num)
  end
end


class IntSet
  attr_reader :store 

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if self.include?(num)
    bucket = num % num_buckets
    @store[bucket].push(num)
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if self.include?(num)
    bucket = num % num_buckets
    @store[bucket].push(num)
    self.count += 1

    if num_buckets < self.count 
      resize!
    end
  end

  def remove(num)
    if self.include?(num)
      bucket = self.store[num % num_buckets]
      bucket.delete(num)
      self.count -= 1
    end
  end

  def include?(num)
    bucket = self.store[num % num_buckets]
    bucket.include?(num)
  end

  private

  def num_buckets
    self.store.length
  end

  def resize!
    old_store = self.store
    self.count = 0 
    self.store = Array.new(old_store.length * 2) { Array.new }
    old_store.flatten.each { |ele| insert(ele) }
  end
end
