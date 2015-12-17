class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    head.next
  end

  def last
    current_link = head.next
    return unless current_link
    current_link = current_link.next until current_link.next.nil?
    current_link
  end

  def empty?
    head.next.nil?
  end

  def get(key)
    result_link = find { |link| link.key  == key }
    result_link ? result_link.val : nil
  end

  def include?(key)
    any? { |link| link.key == key }
  end

  def insert(key, val)
    new_link = Link.new(key, val, nil)
    last.nil? ? head.next = new_link : last.next = new_link
  end

  def remove(key)
    prev_link = head
    current_link = head.next
    until current_link.nil?
      if current_link.key == key
        prev_link.next = current_link.next
        return current_link
      end
      prev_link, current_link = current_link, current_link.next
    end
    false
  end

  def each
    current_link = head.next
    until current_link.nil?
      yield(current_link)
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
