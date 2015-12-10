class Piece
  attr_accessor :position
  attr_reader :color

  def initialize(position, board, color)
    @position = position
    @board = board
    @color = color
  end

  def valid_moves
    moves.reject { |pos| move_into_check?(pos) }
  end

  def move_into_check?(pos)
    board = @board.dup
    board.move!(position, pos)
    board.in_check?(color)
  end

  def dup(new_board)
    self.class.new(position, new_board, color)
  end

  private
  attr_reader :board
end
