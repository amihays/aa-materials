def range(start_num, end_num)
  return [] if end_num < start_num
  range(start_num, end_num - 1).push(end_num)
end

def recursive_sum(array)
  return 0 if array.empty?
  array[0] + recursive_sum(array.drop(1))
end

def iterative_sum(array)
  array.inject(&:+)
end

def exp(base, exponent)
  return 1 if exponent == 0
  base * exp(base, exponent - 1)
end

def exp2(base, exponent)
  if exponent == 0
    1
  elsif exponent == 1
    base
  elsif exponent % 2 == 0
    part = exp2(base, exponent / 2)
    part * part
  else
    part = exp2(base, (exponent - 1) / 2)
    base * part * part
  end
end

class Array
  def deep_dup
    self.map { |el| el.is_a?(Array) ? el.deep_dup : el }
  end
end

def recursive_fibonacci(n)
  return [0, 1].take(n) if n < 3
  prior = recursive_fibonacci(n - 1)
  prior << prior[-1] + prior[-2]
end

def iterative_fibonacci(n)
  fibs = [0, 1].take(n)
  fibs << fibs[-1] + fibs[-2] until fibs.length == n
  fibs
end

def bsearch(array, target)
  return nil if array.empty?
  mid_idx = array.length / 2
  middle = array[mid_idx]
  if target < middle
    bsearch(array.take(mid_idx), target)
  elsif target > middle
    diff = bsearch(array.drop(mid_idx + 1), target)
    diff.nil? ? diff : mid_idx + diff + 1
  else
    mid_idx
  end
end

def make_change(amount, coins)
  return [] if amount == 0
  coins = coins.sort.reverse
  best = nil
  coins.each_with_index do |coin, index|
    next if coin > amount

    remainder = amount - coin
    rest = make_change(remainder, coins.drop(index))
    next if rest.nil?
    current = rest + [coin]

    if (best.nil? || current.length < best.length)
      best = current
    end
  end
  best
end

class Array
  def merge_sort
    return self if length < 2
    mid_idx = length / 2
    left = take(mid_idx)
    right = drop(mid_idx)
    merge(left.merge_sort, right.merge_sort)
  end

  def merge(array1, array2)
    merged = []
    until array1.empty? || array2.empty?
      el = array1.first < array2.first ? array1.shift : array2.shift
      merged << el
    end
    merged.concat(array1).concat(array2)
  end

  def subsets
    return [[]] if empty?
    prior_subsets = self[0...self.length - 1].subsets
    new_subsets = prior_subsets.map { |subset| subset + [(self[-1])] }
    prior_subsets + new_subsets
  end
end
