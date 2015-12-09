require_relative "piece"

class SteppingPiece < Piece
  def moves
    positions = []
    move_diffs.each do |diff|
      new_pos = [position[0] + diff[0], position[1] + diff[1]]
      if board.in_bounds?(new_pos) &&
        (board[new_pos].nil? || board[new_pos].color != color)
        positions << new_pos
      end
    end
    positions
  end
end
