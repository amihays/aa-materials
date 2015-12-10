require_relative "sliding_piece"
require_relative "piece"

class Queen < SlidingPiece
  def move_dirs
    [[0, 1], [1, 0], [-1, 0], [0, -1], [1, 1], [1, -1], [-1, -1], [-1, 1]]
  end

  def to_s
    color == :white ? " \u2655 " : " \u265B "
  end
end
