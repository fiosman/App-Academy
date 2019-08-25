class LRUCache
  
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.size
  end

  def add(el)
    # adds element to cache according to LRU principle
    #This is a horrible implementation of an LRU cache. This is why an array is not approriate as the current add method gives us a O(n) time, where n is the size of the cache.
    if @cache.include?(el) 
      @cache.delete(el)
      @cache << el 
    elsif @cache.length == @size 
      @cache.shift 
      @cache.push(el)
    else
      @cache.push(el)
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache
  end

end