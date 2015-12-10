class Piece
  attr_reader :position, :color

  def initialize(position, board, color)
    @position = position
    @board = board
    @color = color
  end

  def move_into_check?(pos)
  end

  def dup(new_board)
    self.class.new(position, new_board, color)
  end

  private
  attr_reader :board
end
