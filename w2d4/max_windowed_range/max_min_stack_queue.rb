require_relative "max_min_stack"

class MaxMinStackQueue
  def initialize
    @remove_stack = MaxMinStack.new
    @add_stack = MaxMinStack.new
  end

  def min
    if remove_stack.min && add_stack.min
      remove_stack.min < add_stack.min ? remove_stack.min : add_stack.min
    else
      remove_stack.min || add_stack.min
    end
  end

  def max
    if remove_stack.max && add_stack.max
      remove_stack.max > add_stack.max ? remove_stack.max : add_stack.max
    else
      remove_stack.max || add_stack.max
    end
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
