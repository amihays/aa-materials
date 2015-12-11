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
