def two_sum?(array, target_sum) # O(n) space, O(n) time
  values = Hash.new(0)
  array.each do |el|
    return true if values[target_sum - el] > 0
    values[el] += 1
  end
  false
end
