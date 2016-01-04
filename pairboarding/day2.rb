def valid_ip?(string)
  return false unless string =~ /\d+(\.\d+){3}$/
  nums = string.split(".").map(&:to_i)
  nums.all? { |num| num.between?(0, 255) }
end

def sum_from_file(file_path)
  File.readlines(file_path).inject(0) { |sum, line| sum + line.chomp.to_i }
end

def shuffle(array)
  remaining_nums = array.dup
  shuffled_array = []
  until remaining_nums.empty?
    idx = (rand * remaining_nums.length).floor
    shuffled_array.push(remaining_nums.slice!(idx))
  end
  shuffled_array
end

p shuffle([1,2,3,4,5,6])
