def my_min(array)    # O(n^2), O(1) memory
  array.length.times do |i|
    min = true
    (i + 1...array.length).each do |j|
      min = false if array[j] < array[i]
    end
    return array[i] if min
  end
end

def my_min2(array)    # O(n), O(1) memory
  min = array[0]
  array.each { |el| min = el if el < min }
  min
end

def largest_contiguous_subsum(array) # O(2^n), O(2^n) memory
  subsets = contiguous_subsets(array)
  max_sum = 0
  subsets.drop(1).each do |subset|   # O(2^n)
    sum = subset.inject(&:+)
    max_sum = sum if sum > max_sum
  end
  max_sum
end

def contiguous_subsets(array)   # O(2^n) time, O(2^n) memory
  contiguous_subsets = [[]]
  array.length.times do |i|
    (i...array.length).each do |j|
      contiguous_subsets.push(array[i..j])
    end
  end
  contiguous_subsets
end

def largest_contiguous_subsum2(array)  # O(n) time, O(1) memory
  largest_sum = 0  # O(1) time, O(1) memory
  current_sum = 0  # O(1) time, O(1) memory
  array.each do |el|  # O(n) time, O(1) memory
    current_sum += el  # O(1) time, O(1) memory
    if current_sum < 0  # O(1) time, O(1) memory
      current_sum = 0  # O(1) time, O(1) memory
    elsif current_sum > largest_sum  # O(1) time, O(1) memory
      largest_sum = current_sum  # O(1) time, O(1) memory
    end
  end
  largest_sum  # O(1) time, O(1) memory
end
