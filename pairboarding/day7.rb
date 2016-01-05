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
