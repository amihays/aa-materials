class Rook < SlidingPiece
  def move_dirs
    [[0, 1], [1, 0], [-1, 0], [0, -1]]
  end

  def to_s
    color == :white ? " \u2656 " : " \u265C "
  end
end
