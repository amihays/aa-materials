require_relative "player.rb"

class Game
  attr_accessor :dictionary

  def initialize(*players)
    @fragment = ""
    @players = players
    @current_player_index = 0
    @dictionary = {}
    File.readlines("dictionary.txt").each { |word| @dictionary[word.chomp] = true }
    @losses = Hash.new(0)
  end

  def run
    until @players.length == 1
      @fragment = ""
      @dictionary = {}
      File.readlines("dictionary.txt").each { |word| @dictionary[word.chomp] = true }
      play_round
    end
  end

  def play_round
    display_standings
    until @dictionary[@fragment]
      take_turn(current_player)
      next_player!
    end
    @losses[previous_player] += 1
    remove_lost_players
  end

  def remove_lost_players
    @players.reject! { |player| @losses[player] == 5 }
  end

  def display_standings
    puts "\nCurrent standings:"
    @losses.each { |player, losses| puts "#{player.name}: #{record(player)}" }
    puts "\n"
  end

  def record(player)
    loss_count = @losses[player]
    "GHOST"[0...loss_count]
  end

  def current_player
    @players[@current_player_index % @players.length]
  end

  def previous_player
    previous_player_index = (@current_player_index - 1) % @players.length
    @players[previous_player_index]
  end

  def next_player!
    @current_player_index = (@current_player_index + 1) % @players.length
  end

  def take_turn(player)
    letter = player.guess(@fragment)
    until letter && valid_play?(letter)
      player.alert_invalid_guess
      letter = current_player.guess(@fragment)
    end
    @fragment += letter
    @dictionary.select! { |word, value| word.start_with?(@fragment) }
  end

  def valid_play?(letter)
    @dictionary.any? { |word, value| word.start_with?(@fragment + letter) }
  end
end

# ami = Player.new("Ami")
# tom = Player.new("Tom")
# game = Game.new(ami, tom)
# game.run
