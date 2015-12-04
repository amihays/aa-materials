class Board
  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path).map { |line| line.chomp }
    values = lines.map { |line| line.split('') }
    grid = values.map { |row| row.map { |value| Tile.new(value) } }
    Board.new(grid)
  end

  def []=(position,value)
    @grid[position[0]][position[1]] = value
  end

  def render
    @grid.map { |row| row.map { |tile| tile.to_s }.join(" ") }.join("\n")
  end

  def solved?
    return false if @grid.any? { |row| !section_solved?(row) }
    return false if @grid.transpose.any? { |col| !section_solved?(column) }
    return false if squares.any? { |square| !square_solved?(square) }
  end

  def section_solved?(section_array)
    section_array.sort == ("1".."9").to_a
  end

  def squares
    flattened_squares = []
    3.times do |i|
      row_start = i * 3
      3.times do |j|
        column_start = j * 3
        square = @grid.map { |row| row[column_start...column_start + 3] }[row_start...row_start + 3]
        flattened_squares << square.flatten
      end
    end
    flattened_squares
  end
end
