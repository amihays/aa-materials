class Board
  def initialize(size)
    @grid = Array.new(size) { Array.new(size) { Tile.new } }
    seed_grid
  end

  def seed_grid(size)
    @grid.flatten.sample(size).each { |tile| tile.make_bomb }
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
