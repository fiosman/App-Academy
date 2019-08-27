require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :store, :count, :prc, :map 

  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if self.map.include?(key)
      update_node!(key)
    else
      eject! if count >= @max
      calc!(key)
    end
    @map[key].val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = self.prc.call(key)
    node = self.store.append(key, val)
    self.map[key] = node
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node = @map.get(node)
    self.store.remove(node.key)
    self.store.append(node.key, node.val)
  end

  def eject!
    lru_key = self.store.first.key 
    self.store.remove(lru_key)
    self.map.delete(lru_key)
  end
end
