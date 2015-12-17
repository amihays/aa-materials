require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if include?(key)
      delete(key)
    else
      @count += 1
    end
    bucket(key).insert(key, val)
    resize! if @count > num_buckets
  end

  def get(key)
    bucket(key).each { |link| return link.val if link.key == key }
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each
    store.each do |bucket|
      bucket.each { |link| yield(link.key, link.val) }
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private
  attr_reader :store

  def num_buckets
    @store.length
  end

  def resize!
    prev_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    prev_store.each do |bucket|
      bucket.each { |link| set(link.key, link.val) }
    end
  end

  def bucket(key)
    store[key.hash % num_buckets]
  end
end
