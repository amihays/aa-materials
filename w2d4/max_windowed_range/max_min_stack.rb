class MaxMinStack
  def initialize
    @store = []
  end

  def peek
    store.last[:value] if store.last
  end

  def push(el)
    new_min = (min.nil? || el < min) ? el : min
    new_max = (max.nil? || el > max) ? el : max
    new_el = { value: el,
               current_min: new_min,
               current_max: new_max}
    store.push(new_el)
    nil
  end

  def pop
    store.pop[:value]
  end

  def min
    store.last[:current_min] if store.last
  end

  def max
    store.last[:current_max] if store.last
  end

  def size
    store.size
  end

  def empty?
    store.empty?
  end

  private
  attr_reader :store
end
