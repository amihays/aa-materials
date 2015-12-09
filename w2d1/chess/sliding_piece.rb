class SlidingPiece < Piece
  def moves
    positions = []
    move_dirs.each do |dir|
      new_pos = [position[0] + dir[0], position[1] + dir[1]]
      while board.in_bounds(new_pos)
        positions << new_pos
        new_pos = [position[0] + dir[0], position[1] + dir[1]]
      end
    end
  end
end
