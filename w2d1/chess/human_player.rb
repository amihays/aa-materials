require_relative "board"
require_relative "display"

class HumanPlayer
  def initialize(color, display, board)
    @color = color
    @display = display
    @board = board
  end

  def play_turn
    start_pos = nil
    end_pos = nil
    until start_pos
      @display.render
      start_pos ||= @display.get_input
    end
    until end_pos
      @display.render
      end_pos ||= @display.get_input
    end
    @board.move(start_pos, end_pos, @color)
  end
end
