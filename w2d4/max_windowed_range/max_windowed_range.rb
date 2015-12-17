def windowed_max_range(array, range) # O(n * m) time, O(m) space
  max_range = nil
  array.each_index do |idx1|
    sub_array = array.slice(idx1...idx1 + range)
    diff = sub_array.max - sub_array.min
    max_range = diff if max_range.nil? || max_range < diff
  end
  max_range
end
