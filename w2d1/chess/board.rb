require_relative "piece"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { [] } }
    populate_grid
  end

  def populate_grid
    self[[0, 0]] = Piece.new()
    self[[0, 1]] = Piece.new()
    self[[0, 2]] = Piece.new()
    self[[0, 3]] = Piece.new()
    self[[0, 4]] = Piece.new()
    self[[0, 5]] = Piece.new()
    self[[0, 6]] = Piece.new()
    self[[0, 7]] = Piece.new()
    self[[7, 0]] = Piece.new()
    self[[7, 1]] = Piece.new()
    self[[7, 2]] = Piece.new()
    self[[7, 3]] = Piece.new()
    self[[7, 4]] = Piece.new()
    self[[7, 5]] = Piece.new()
    self[[7, 6]] = Piece.new()
    self[[7, 7]] = Piece.new()
  end

  def move(start_pos, end_pos)
    raise "No piece there" if self[start_pos].nil?
    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
  end

  def in_bounds?(new_pos)
    new_pos.all? { |coord| coord > 0 && coord < @grid.length }
  end

  private
  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end
end
