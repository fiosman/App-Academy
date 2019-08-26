class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    bucket = key.hash % num_buckets
    self.store[bucket] << key.hash 
    self.count += 1 

    if num_buckets < self.count 
      resize!
    end
  end

  def include?(key)
    bucket = self.store[key.hash % num_buckets]
    bucket.include?(key.hash)
  end

  def remove(key)
    if self.include?(key)
      bucket = self.store[key.hash % num_buckets] 
      bucket.delete(key.hash)
      self.count -= 1
    end
  end

  private

  def num_buckets
    self.store.length
  end

  def resize!
    old_store = @store 
    self.count = 0 
    self.store = Array.new(old_store.length * 2) { Array.new }
    old_store.flatten.each { |ele| insert(ele) }
  end
end
