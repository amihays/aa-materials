def subsets(array)
  return [[]] if array.empty?
  prior_subsets = subsets(array.take(array.length - 1))
  new_subsets = prior_subsets.map { |subset| subset + [array.last] }
  prior_subsets + new_subsets
end

def longest_palindrome(string)
  longest = ""
  mid_idx = 0
  until mid_idx > string.length - 1
    diameter = 0
    until mid_idx - diameter < 0 || mid_idx + diameter > string.length - 1
      break if string[mid_idx - diameter] != string[mid_idx + diameter]
      longest = string[mid_idx - diameter .. mid_idx + diameter] if diameter * 2 + 1 > longest.length
      diameter += 1
    end
    mid_idx += 1
  end
  mid_idx = 0
  until mid_idx > string.length - 1
    diameter = 0
    until mid_idx - diameter < 0 || mid_idx + diameter + 1 > string.length - 1
      break if string[mid_idx - diameter] != string[mid_idx + diameter + 1]
      longest = string[mid_idx - diameter .. mid_idx + diameter + 1] if diameter * 2 + 2 > longest.length
      diameter += 1
    end
    mid_idx += 1
  end
  longest
end

def intersection1(arr1, arr2)
  arr1.select { |el| arr2.include?(el) }
end

def intersection2(arr1, arr2)
  sort1, sort2 = arr1.sort, arr2.sort
  i1, i2 = 0, 0
  intersection = []
  until i1 >= sort1.length || i2 >= sort2.length
    if sort1[i1] == sort2[i2]
      intersection << sort1[i1]
      i1 += 1
      i2 += 1
    elsif sort1[i1] > sort2[i2]
      i2 += 1
    else
      i1 += 1
    end
  end
  intersection
end

def intersection3(arr1, arr2)
  els1 = Hash.new(0)
  arr1.each { |el| els1[el] += 1 }
  intersection = []
  arr2.each do |el|
    if els1[el] > 0
      intersection << el
      els1[el] -= 1
    end
  end
  intersection
end

def common_subsets(arr1, arr2)
  intersection = intersection3(arr1, arr2)
  subsets(intersection)
end

def subsets(arr)
  return [[]] if arr.empty?
  prior_subsets = subsets(arr.take(arr.length - 1))
  new_subsets =  prior_subsets.map { |sub| sub + [arr.last] }
  prior_subsets.concat(new_subsets)
end

def can_win(array, idx)
  reachable = [idx]
  seen = {}
  until reachable.empty?
    i = reachable.shift
    return true if array[i] == 0
    el1 = (idx + array[i]) % array.length
    el2 = (idx - array[i]) % array.length
    reachable << el1 unless seen[el1]
    reachable << el2 unless seen[el2]
    seen[el1], seen[el2] = true, true
  end
  false
end

puts can_win([1,2,3,4,0], 2)
puts can_win([1,2,3,4,0], 3)
puts can_win([2,0,2,4], 0)
