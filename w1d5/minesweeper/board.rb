require_relative "tile"

class Board
  attr_reader :grid
  
  def initialize(size)
    @grid = build_grid(size)
    seed_grid
  end

  def display
    puts @grid.map { |row| row.join(" ") }.join("\n")
  end

  def build_grid(size)
    grid = []
    size.times do |row_idx|
      row = []
      size.times { |col_idx| row << Tile.new(self, [row_idx, col_idx]) }
      grid << row
    end
    grid
  end

  def seed_grid
    @grid.flatten.sample(10).each { |tile| tile.make_bomb }
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def reveal(pos)
    self[pos].reveal
  end

  def won?
    @grid.flatten.all? { |tile| tile.revealed || tile.bombed }
  end

  def lost?
    @grid.flatten.any? { |tile| tile.revealed && tile.bombed }
  end
end
