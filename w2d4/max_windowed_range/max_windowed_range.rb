require_relative "max_min_stack_queue"

def max_windowed_range(array, range) # O(n * m) time, O(m) space
  max_diff = nil
  array.each_index do |idx1|
    sub_array = array.slice(idx1...idx1 + range)
    diff = sub_array.max - sub_array.min
    max_diff = diff if max_diff.nil? || max_diff < diff
  end
  max_diff
end

def max_windowed_range2(array, range) # O(n) time, O(m) space
  queue = MaxMinStackQueue.new
  max_diff = nil
  array.each_index do |idx1|
    queue.enqueue(array[idx1])
    queue.dequeue if queue.size > range
    diff = queue.max - queue.min
    max_diff = diff if max_diff.nil? || max_diff < diff
  end
  max_diff
end
