def matrix_regional_sum(matrix, top_left_coords, bottom_right_coords)
  sum = 0
  matrix[top_left_coords.first..bottom_right_coords.first].each do |row|
    row[top_left_coords[1]..bottom_right_coords[1]].each do |el|
      sum += el
    end
  end
  sum
end

def merge_sort(array)
  return array if array.length < 2
  left = array.take(array.length / 2)
  right = array.drop(array.length / 2)
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if right.first < left.first
      merged.push(right.shift)
    else
      merged.push(left.shift)
    end
  end
  merged.concat(left).concat(right)
end

def binary_search(array, target)
  return nil if array.empty?
  mid_idx = array.length / 2
  if array[mid_idx] > target
    binary_search(array.take(mid_idx - 1), target)
  elsif array[mid_idx] == target
    mid_idx
  else
    diff = binary_search(array.drop(mid_idx + 1), target)
    diff.nil? ? nil : diff + mid_idx + 1
  end
end

def productify(nums)
  products = Array.new(nums.length, 1)
  left_product = 1
  0.upto(nums.length - 1) do |i|
    products[i] *= left_product
    left_product *= nums[i]
  end
  right_product = 1
  (nums.length - 1).downto(0) do |i|
    products[i] *= right_product
    right_product *= nums[i]
  end
  products
end
