require_relative "stack"

class StackQueue
  def initialize
    @add_stack = Stack.new
    @remove_stack = Stack.new
  end

  def enqueue(el)
    add_stack.push(el)
    nil
  end

  def dequeue
    refill_remove_stack if remove_stack.empty?
    remove_stack.pop
  end

  def size
    add_stack.size + remove_stack.size
  end

  def empty?
    add_stack.empty? && remove_stack.empty?
  end

  private
  attr_reader :add_stack, :remove_stack

  def refill_remove_stack
    remove_stack.push(add_stack.pop) until add_stack.empty?
  end
end
