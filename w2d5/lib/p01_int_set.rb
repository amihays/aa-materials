class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    store[num] = true
  end

  def remove(num)
    validate!(num)
    store[num] = false
  end

  def include?(num)
    validate!(num)
    store[num]
  end

  private
  attr_reader :store

  def is_valid?(num)
    num >= 0 && num < @store.length
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num) unless include?(num)
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  attr_reader :store

  def [](num)
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      @count += 1
      self[num].push(num)
      resize! if @count > num_buckets
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  attr_reader :store

  def [](num)
    store[num % num_buckets]
  end

  def num_buckets
    store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    store.flatten.each do |num|
      new_store[num % new_store.length].push(num)
    end
    @store = new_store
  end
end
