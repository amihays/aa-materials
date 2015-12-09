require_relative "piece"

class SlidingPiece < Piece
  def moves
    positions = []
    move_dirs.each do |dir|
      new_pos = [position[0] + dir[0], position[1] + dir[1]]
      while board.in_bounds?(new_pos) && board[new_pos].nil?
        positions << new_pos
        new_pos = [new_pos[0] + dir[0], new_pos[1] + dir[1]]
      end
      if board.in_bounds?(new_pos) && board[new_pos].color != color
        positions << new_pos
      end
    end
    positions
  end
end
