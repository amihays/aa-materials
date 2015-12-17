class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil, nxt = nil, prev = nil)
    @key, @val, @next, @prev = key, val, nxt, prev
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail

  def initialize
    @head, @tail = Link.new, Link.new
    @head.next, @tail.prev = tail, head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    head.next unless empty?
  end

  def last
    return if empty?
    current_link = head.next
    current_link = current_link.next until current_link.next == tail
    current_link
  end

  def empty?
    head.next == tail
  end

  def get(key)
    result_link = find { |link| link.key  == key }
    result_link ? result_link.val : nil
  end

  def include?(key)
    any? { |link| link.key == key }
  end

  def insert(key, val)
    new_link = Link.new(key, val, tail, nil)
    if empty?
      head.next = new_link
      new_link.prev = head
    else
      new_link.prev = last
      last.next = new_link
    end
    tail.prev = new_link
  end

  def remove(key)
    remove_link = find { |link| link.key == key }
    return unless remove_link
    remove_link.prev.next = remove_link.next
    remove_link.next.prev = remove_link.prev
    remove_link
  end

  def each
    current_link = head.next
    until current_link == tail
      yield(current_link)
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
