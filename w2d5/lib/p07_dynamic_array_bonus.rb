class StaticArray
  attr_reader :store
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    if i < 0 && i.abs < capacity
      @store[count + i]
    elsif i.abs < capacity
      @store[i]
    end
  end

  def []=(i, val)
    if i >= @count
      (i - @count).times { push(nil) }
      push(val)
    elsif i < 0
      return nil if i < -(@count)
      @store[@count + i] = val
    else
      @store[i] = val
    end
  end

  def capacity
    @store.length
  end

  def include?(val)
    any? { |el| el == val }
  end

  def push(val)
    # One spec won't pass:
    # "DynamicArray#resize! should call #resize!
    # when too many elements are inserted"
    # count == 3 and capacity == 3 in that spec

    # Resizing works in all other specs when push is called.

    # Works (although spec still fails because
    # looks for "#resize!" call) if I change "resize!"
    # to "resizee!"
    resize! if @count >= self.capacity
    puts(@count, self.capacity) if val == 4
    @store[count] = val
    @count += 1
    self
  end

  def unshift(val)
    resize! if count >= capacity
    i = count
    until i <= 0
      @store[i] = @store[i - 1]
      i -= 1
    end
    @store[0] = val
  end

  def pop
    return nil if count == 0
    last_el = last
    @store[count - 1] = nil
    @count -= 1
    last_el
  end

  def shift
    return nil if count == 0
    first_el = first
    i = 0
    while i < @store.length - 1
      @store[i] = @store[i + 1]
      i += 1
    end
    @store[i] = nil
    @count -= 1
    first_el
  end

  def first
    @store[0]
  end

  def last
    @store[count - 1]
  end

  def each
    i = 0
    while i < count
      yield(@store[i])
      i += 1
    end
    self
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    return false unless count == other.count
    each_with_index { |el, i| return false unless el == other[i] }
    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    puts "resizing!"
    new_store = StaticArray.new(capacity * 2)
    each_with_index { |el, i| new_store[i] = el }
    @store = new_store
  end
end
