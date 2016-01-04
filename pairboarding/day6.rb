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

puts longest_palindrome("abcbccbcba")
