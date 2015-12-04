require_relative "board.rb"

class Game
  def initialize(file_path)
    @board = Board.from_file(file_path)
  end

  def play
    until @board.solved?
      system("clear")
      @board.render
      position = get_position
      value = get_value
      @board[position] = value
    end
    system("clear")
    @board.render
    puts "You win!"
  end

  def get_position
    puts "Where would you like to move? ex: '3,4'"
    gets.chomp.split(",").map { |num| num.to_i }
  end

  def get_value
    puts "What value would you like to put there? ex: '9'"
    gets.chomp
  end
end

game = Game.new("puzzles/sudoku1.txt")
game.play
