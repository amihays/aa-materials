require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
  def initialize(player)
    @board = Board.new
    @previous_guess = nil
    @player = player
  end

  def play
    until over
      system("clear")
      @player.prompt(@board)
      pos = @player.get_input
      make_guess(pos)
    end
    @board.render
    puts "You win!"
  end

  def make_guess(pos)
    value = @board.reveal(pos)
    @player.receive_revealed_card(pos, value)
    @board.render
    sleep(1)
    if @previous_guess
      if @board.grid[@previous_guess[0]][@previous_guess[1]] != @board.grid[pos[0]][pos[1]]
        @board.grid[@previous_guess[0]][@previous_guess[1]].hide
        @board.grid[pos[0]][pos[1]].hide
      else
        @player.receive_match(@previous_guess, pos)
      end
      @previous_guess = nil
      @player.previous_guess = nil
    else
      @previous_guess = pos
      @player.previous_guess = pos
    end
  end

  def over
    @board.won?
  end
end

ami = HumanPlayer.new("Ami")
game = Game.new(ami)
game.play
