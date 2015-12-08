require_relative "board"

class Minesweeper
  def initialize
    @board = Board.new(10)
  end

  def play
    until @board.won? || @board.lost?
      system("clear")
      play_turn
    end
    system("clear")
    @board.won? ? handle_win : handle_loss
  end

  private
  def play_turn
    @board.display
    prompt
    input = get_input
    if input[0] == "f"
      @board[input[1]].toggle_flag
    elsif input[0] == "r"
      @board[input[1]].reveal
    else
      raise "invalid input"
    end
  end

  def handle_win
    @board.display
    puts "You win!"
  end

  def handle_loss
    @board.display
    puts "Better luck next time."
  end

  def prompt
    puts "What action would you like to take?"
    puts "(ex: 'f 1,2' to flag position [1, 2])"
    puts "(ex: 'r 3,7' to reveal position [3, 7])"
  end

  def get_input
    input = gets.chomp
    parse(input)
  end

  def parse(input)
    action, position = input.split(" ")
    position = position.split(",").map{ |el| el.to_i }
    [action, position]
  end
end

game = Minesweeper.new()
game.play
