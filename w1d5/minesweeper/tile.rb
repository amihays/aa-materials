class Tile
  attr_reader :bombed, :revealed
  
  DIFFS = [[-1, -1], [0, -1], [-1, 0], [1, 0], [0, 1], [1, 1]]

  def initialize(board, position, bombed)
    @board = board
    @position = position
    @bombed = bombed
    @revealed = false
    @flagged = false
  end

  def make_bomb
    @bombed = true
  end

  def reveal
    @flagged = false
    @revealed = true
    if neighbor_bomb_count == 0
      neighbors.each { |neighbor| neighbor.reveal }
    end
  end

  def flag
    @flagged = true
  end

  def neighbor_bomb_count
    neighbors.count { |neighbor| neighbor.bombed }
  end

  def neighbors
    neighbors = []
    DIFFS.each do |diff|
      neighbor_pos = [@position[0] + diff[0], @position[1] + diff[1]]
      next if neighbor_pos.any? { |el| el < 0 || el >= @board.length }
      neighbors << @board[neighbor_pos]
    end
    neighbors
  end

  def inspect
    "<Tile - position: #{@position}, bombed: #{@bombed}, flagged: #{@flagged}, revealed: #{@revealed}>"
  end

  def to_s
    if @revealed && @bombed
      "B"
    elsif @revealed
      num_bombs = neighbor_bomb_count
      num_bombs == 0 ? "_" : num_bombs.to_s
    elsif @flagged
      "F"
    else
      "*"
    end
  end
end
