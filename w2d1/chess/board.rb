require_relative "queen"
require_relative "king"
require_relative "rook"
require_relative "knight"
require_relative "pawn"
require_relative "bishop"

class Board
  attr_reader :grid

  def initialize(fill_board = true)
    @grid = Array.new(8) { Array.new(8) { nil } }
    populate_grid if fill_board
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
      self[[6, col]] = Pawn.new([6, col], self, :white)
    end
  end

  def move(start_pos, end_pos)
    raise "No piece there" if self[start_pos].nil?
    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
  end

  def move!(start_pos, end_pos)
    piece = self[start_pos]
    piece.position = end_pos
    self[start_pos], self[end_pos] = nil, piece
  end

  def in_check?(color)
    king_pos = find_king(color)
    raise "No king!" if king_pos.nil?
    other_color = color == :white ? :black : :white
    opposing_pieces = find_pieces(other_color)
    opposing_pieces.any? { |piece| piece.moves.include?(king_pos) }
  end

  def checkmate?(color)
    pieces = find_pieces(color)
    out_of_moves = pieces.all? { |piece| piece.valid_moves.empty? }
    out_of_moves && in_check?
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

  def dup
    dup_board = Board.new(false)
    self.grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        unless cell.nil?
          dup_piece = cell.dup(dup_board)
          dup_board[[row_idx, col_idx]] = dup_piece
        end
      end
    end
    dup_board
  end

  private
  def find_pieces(color)
    pieces = []
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        if !cell.nil? && cell.color == color
          pieces << self[[row_idx, col_idx]]
        end
      end
    end
    pieces
  end

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
p board[[0,1]].valid_moves
