def missing_num(array)
  sum = array.inject(&:+)
  total_sum = array.length * (array.length + 1) / 2
  total_sum - sum
end

class Stack
  def initialize
    @values = []
  end

  def max
    @values.last.last unless @values.empty?
  end

  def push(el)
    if @values.empty?
      @values << [el, el]
    else
      new_max = [max, el].max
      @values << [el, new_max]
    end
  end

  def pop
    @values.pop.first
  end
end

class StackQueue
  def initialize
    @on_stack = []
    @off_stack = []
  end

  def enqueue(el)
    @on_stack << el
  end

  def dequeue
    if @off_stack.empty?
      @off_stack << @on_stack.pop until @on_stack.empty?
    end
    @off_stack.pop
  end
end

class MaxMinStack
  def initialize
    @values = []
  end

  def min
    @values.empty? ? nil : @values.last[2]
  end

  def max
    @values.empty? ? nil : @values.last[1]
  end

  def push(el)
    if @values.empty?
      @values << [el, el, el]
    else
      new_min = [min, el].min
      new_max = [max, el].max
      @values << [el, new_max, new_min]
    end
  end

  def pop
    @values.empty? ? nil : @values.pop[0]
  end

  def length
    @values.length
  end
end

class MinMaxStackQueue
  def initialize
    @on_stack = MaxMinStack.new
    @off_stack = MaxMinStack.new
  end

  def enqueue(value)
    @on_stack.push(value)
  end

  def dequeue
    refill_off_stack if @off_stack.length == 0
    @off_stack.pop
  end

  def refill_off_stack
    @off_stack.push(@on_stack.pop) until @on_stack.length == 0
  end

  def length
    @on_stack.length + @off_stack.length
  end

  def min
    [@on_stack.min, @off_stack.min].reject { |el| el.nil? }.min
  end

  def max
    [@on_stack.max, @off_stack.max].reject { |el| el.nil? }.max
  end
end

def max_windowed_range(array, w)
  max_range = nil
  window = MinMaxStackQueue.new
  array.each do |el|
    window.enqueue(el)
    window.dequeue if window.length > w
    range = window.max - window.min
    max_range = range if max_range.nil? || range > max_range
  end
  max_range
end
