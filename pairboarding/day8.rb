def missing_num(array)
  sum = array.inject(&:+)
  total_sum = array.length * (array.length + 1) / 2
  total_sum - sum
end
