require_relative "stepping_piece"

class Knight < SteppingPiece
  def move_diffs
    [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end

  def to_s
    color == :white ? " \u2658 " : " \u265E "
  end
end
