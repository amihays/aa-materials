class Pawn < Piece
  def initialize(position, board, color)
    super
    @first_move = true
  end

  def move_dir
    color == :black ? 1 : -1
  end

  def moves
    positions = []
    new_pos = [position[0] + move_dir, position[1]]
    if board.in_bounds?(new_pos) &&
      (board[new_pos].nil? || board[new_pos].color != color)
      positions << new_pos
    end
    if @first_move
      new_pos = [position[0] + move_dir * 2, position[1]]
      if board.in_bounds?(new_pos) &&
        (board[new_pos].nil? || board[new_pos].color != color)
        positions << new_pos
      end
    end
    positions
  end
end
