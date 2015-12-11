class Array
  def my_uniq
    unique = []
    each { |el| unique << el unless unique.include?(el) }
    unique
  end

  def two_sum(target = 0)
    pairs = []
    each_index do |idx|
      (idx + 1...length).each do |idx2|
        pairs << [idx, idx2] if self[idx] + self[idx2] == target
      end
    end
    pairs
  end

  def my_transpose
    return [] if empty?
    transpose = Array.new(self[0].length) { Array.new(length) }
    each_with_index do |row, row_idx|
      row.each_with_index do
        |cell, col_idx| transpose[col_idx][row_idx] = cell
      end
    end
    transpose
  end
end

def stock_picker(prices)
  return if !prices.is_a?(Array) || prices.empty?
  max_diff = 0
  days = [0, 0]
  prices.each_index do |day1|
    (day1...prices.length).each do |day2|
      if prices[day2] - prices[day1] > prices[days[1]] - prices[days[0]]
        days = [day1, day2]
      end
    end
  end
  days
end
