require_relative "stepping_piece"

class King < SteppingPiece
  def move_diffs
    [[0, 1], [1, 0], [-1, 1], [1, -1], [1, 1], [-1, -1], [0, -1], [-1, 0]]
  end
end
