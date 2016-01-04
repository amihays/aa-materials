def uniq_subs(string)
  subs = {}
  (0...string.length).each do |start_idx|
    (start_idx...string.length).each do |end_idx|
      subs[string[start_idx..end_idx]] = true
    end
  end
  subs.keys
end

def largest_contiguous_subsum(integers)
  max_sum = 0
  current_sum = 0
  integers.each do |num|
    current_sum += num
    max_sum = current_sum if max_sum < current_sum
    current_sum = 0 if current_sum < 0
  end
  max_sum
end

def silly_years(year)
  years = []
  next_year = year + 1
  until years.length == 10
    year_str = next_year.to_s
    if year_str[0..1].to_i + year_str[2..3].to_i == year_str[1..2].to_i
      years << next_year
    end
    next_year += 1
  end
  years
end

## Not what problem was asking for:
# def pair_sum(arr, target)
#   num_indices = Hash.new { |h, k| h[k] = [] }
#   arr.each_with_index { |el, idx| num_indices[el] << idx }
#   pairs = []
#   arr.each_with_index do |el, i|
#     num_indices[target - el].each do |j|
#       pairs << [i, j] if i < j
#     end
#   end
#   pairs
# end

def pair_sum(arr, target)
  nums = {}
  arr.each { |num| nums[num] = true }
  pairs = {}
  arr.each do |el1|
    el2 = target - el1
    if el1 < el2 && nums[el2] && !pairs.include?([el1, el2])
      pairs[[el1, el2]] = true
    end
  end
  pairs.keys
end
