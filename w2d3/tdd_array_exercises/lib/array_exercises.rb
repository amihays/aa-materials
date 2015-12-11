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
end
