class Piece
  attr_reader :position

  def initialize(position, board)
    @position = position
    @board = board
  end

  def moves
    []
  end

  private
  attr_reader :board
end
