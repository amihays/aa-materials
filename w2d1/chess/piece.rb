class Piece
  attr_reader :position, :color

  def initialize(position, board, color)
    @position = position
    @board = board
    @color = color
  end

  private
  attr_reader :board
end
