require "yaml"
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
    perform_move(input)
  end

  def perform_move(input)
    if input[0].downcase == "save"
      save
    elsif input[0] == "f"
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
    puts "(ex: 'save' to save)"
  end

  def get_input
    input = gets.chomp
    parse_input(input)
  end

  def parse_input(input)
    return [input] if input.downcase == "save"
    action, position = input.split(" ")
    position = position.split(",").map{ |el| el.to_i }
    [action, position]
  end

  def save
    puts "What filename would you like to save to?"
    filename = gets.chomp

    File.write(filename, YAML.dump(self))
  end
end


if __FILE__ == $PROGRAM_NAME
  case ARGV.count
  when 0
    Minesweeper.new().play
  when 1
    YAML.load_file(ARGV.shift).play
  end
end
