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
