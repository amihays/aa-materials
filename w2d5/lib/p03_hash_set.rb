require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    @count += 1
    self[key].push(key)
    resize! if @count > num_buckets
    key
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    @count -= 1 if include?(key)
    self[key].delete(key)
  end

  private

  def [](key)
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }
    prev_store.flatten.each { |key| insert(key) }
  end
end
