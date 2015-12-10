require_relative "board"
require_relative "display"
require_relative "human_player"

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      :white => HumanPlayer.new(:white, @display, @board),
      :black => HumanPlayer.new(:black, @display, @board)
    }
    @current_player = :black
  end

  def switch_players!
    @current_player = @current_player == :white ? :black : :white
  end

  def play
    until @board.checkmate?(:white) || @board.checkmate?(:black)
      play_turn
      switch_players!
    end
    winner = @board.checkmate?(:black) ? :white : :black
    puts "#{winner} wins!"
  end

  def play_turn
    begin
      @players[@current_player].play_turn
    rescue StandardError => e
      puts "Error: #{e.message}"
      sleep(1)
      retry
    end
  end
end

game = Game.new
game.play
