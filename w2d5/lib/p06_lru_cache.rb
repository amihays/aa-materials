require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
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
    if @map[key]
      link = @map[key]
      update_link!(link)
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    value = @prc.call(key)
    new_link = @store.insert(key, value)
    @map[key] = new_link
    eject! if count > @max
    value
  end

  def update_link!(link)
    link.prev.next = link.next
    link.next.prev = link.prev
    link.prev = @store.tail.prev
    @store.tail.prev.next = link
    link.next = @store.tail
    @store.tail.prev = link
    link.val
  end

  def eject!
    remove_link = @store.first
    remove_link.prev.next = remove_link.next
    remove_link.next.prev = remove_link.prev
    @map.delete(remove_link.key)
  end
end
