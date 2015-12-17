class Queue
  def initialize
    @store = []
  end

  def enqueue(el)
    store.push(el)
  end

  def dequeue
    store.shift
  end

  def peek
    store.first
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
