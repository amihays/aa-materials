require_relative "queen"
require_relative "king"
require_relative "rook"
require_relative "knight"
require_relative "pawn"
require_relative "bishop"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { nil } }
    populate_grid
  end

  def populate_grid
    self[[0, 0]] = Rook.new([0, 0], self, :black)
    self[[0, 1]] = Knight.new([0, 1], self, :black)
    self[[0, 2]] = Bishop.new([0, 2], self, :black)
    self[[0, 3]] = Queen.new([0, 3], self, :black)
    self[[0, 4]] = King.new([0, 4], self, :black)
    self[[0, 5]] = Bishop.new([0, 5], self, :black)
    self[[0, 6]] = Knight.new([0, 6], self, :black)
    self[[0, 7]] = Rook.new([0, 7], self, :black)
    self[[7, 0]] = Rook.new([7, 0], self, :white)
    self[[7, 1]] = Knight.new([7, 1], self, :white)
    self[[7, 2]] = Bishop.new([7, 2], self, :white)
    self[[7, 3]] = Queen.new([7, 3], self, :white)
    self[[7, 4]] = King.new([7, 4], self, :white)
    self[[7, 5]] = Bishop.new([7, 5], self, :white)
    self[[7, 6]] = Knight.new([7, 6], self, :white)
    self[[7, 7]] = Rook.new([7, 7], self, :white)
    8.times do |col|
      self[[1, col]] = Pawn.new([1, col], self, :black)
      self[[6, col]] = Pawn.new([1, col], self, :white)
    end
  end

  def move(start_pos, end_pos)
    raise "No piece there" if self[start_pos].nil?
    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
  end

  def in_check?(color)
    king_pos = find_king(color)
    raise "No king!" if king_pos.nil?

  end

  def checkmate?(color)
  end

  def in_bounds?(new_pos)
    new_pos.all? { |coord| coord >= 0 && coord < @grid.length }
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  private
  def find_king(color)
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        if cell.is_a?(King) && cell.color == color
          return [row_idx, col_idx]
        end
      end
    end
    nil
  end
end

board = Board.new
p board[[1,0]].moves
