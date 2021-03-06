require_relative "stepping_piece"

class King < SteppingPiece
  def move_diffs
    [[0, 1], [1, 0], [-1, 1], [1, -1], [1, 1], [-1, -1], [0, -1], [-1, 0]]
  end

  def to_s
    color == :white ? " \u2654 " : " \u265A "
  end
end
