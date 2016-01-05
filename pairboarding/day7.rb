def fake_sort(arr)
  (1..arr.length).to_a
end

def sorta_sort(arr, max)
  counts = Array.new(max + 1, 0)
  arr.each { |el| counts[el] += 1 }
  sorted = []
  counts.length.times do |idx|
    until counts[idx] == 0
      sorted << idx
      counts[idx] -= 1
    end
  end
  sorted
end

def string_sort(strings, length)
  (length - 1).downto(0) do |idx|
    buckets = Array.new(26) { [] }
    strings.each do |string|
      letter = string[idx]
      buckets[letter.ord - "a".ord] << string
    end
    strings = []
    buckets.each do |bucket|
      bucket.each { |string| strings << string }
    end
  end
  strings
end

def weighted_random_index(array)
  sum = array.inject(&:+)
  rand_num = rand(sum)
  upper_bound = 0
  array.each_with_index do |el, idx|
    upper_bound += el
    return idx if rand_num < upper_bound
  end
end

def weighted_random_index_test(array)
  tallies = Array.new(array.length, 0)
  1000000.times do
    num = weighted_random_index(array)
    tallies[num] += 1
  end
  tallies
end
