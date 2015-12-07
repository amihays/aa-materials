require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    other_mark = evaluator == :x ? :o : :x
    if board.over?
      return board.winner == other_mark
    end
    if next_mover_mark == evaluator
      children.all? { |child| child.losing_node?(evaluator) }
    else
      children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator
    end
    if next_mover_mark == evaluator
      children.any? { |child| child.winning_node?(evaluator) }
    else
      children.all? { |child| child.winning_node?(evaluator) }
    end
  end

  def children
    children_nodes = []
    3.times do |row_idx|
      3.times do |col_idx|
        pos = [row_idx, col_idx]
        if @board.empty?(pos)
          duped_board = @board.dup
          duped_board[pos] = @next_mover_mark
          other_mark = @next_mover_mark == :x ? :o : :x
          children_nodes.push(TicTacToeNode.new(duped_board, other_mark, pos))
        end
      end
    end
    children_nodes
  end
end
