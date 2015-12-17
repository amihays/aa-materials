def windowed_max_range(array, range) # O(n * m) time, O(m) space
  max_range = nil
  array.each_index do |idx1|
    sub_array = array.slice(idx1...idx1 + range)
    diff = sub_array.max - sub_array.min
    max_range = diff if max_range.nil? || max_range < diff
  end
  max_range
end


puts windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
puts windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
puts windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
puts windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
