class Stack
  def initialize
    @store = []
  end

  def pop
    store.pop
  end

  def push(el)
    store.push(el)
    nil
  end

  def peek
    store.last
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
