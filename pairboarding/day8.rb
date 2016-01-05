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
