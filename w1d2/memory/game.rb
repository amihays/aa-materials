require_relative "board.rb"

class Game
  def initialize
    @board = Board.new
    @previous_guess = nil
  end

  def play
    until over
      system("clear")
      @board.render
      prompt
      pos = gets.chomp.split(",").map{ |num| num.to_i }
      make_guess(pos)
    end
    @board.render
    puts "You win!"
  end

  def make_guess(pos)
    @board.reveal(pos)
    if @previous_guess
      unless @board.grid[@previous_guess[0]][@previous_guess[1]] == @board.grid[pos[0]][pos[1]]
        @board.render
        sleep(2)
        @board.grid[@previous_guess[0]][@previous_guess[1]].hide
        @board.grid[pos[0]][pos[1]].hide
      end
      @previous_guess = nil
    else
      @previous_guess = pos
    end
  end

  def over
    @board.won?
  end

  def prompt
    puts "Which card would you like to flip?"
  end
end

game = Game.new
game.play
