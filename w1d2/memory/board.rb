require_relative "card.rb"

class Board
  def initialize
    populate
  end

  def populate
    cards = []
    (1..8).each do |num|
      2.times { cards << Card.new(num) }
    end
    cards.shuffle!
    @grid = []
    4.times do |i|
      @grid.push(cards[i...i + 4])
    end
  end

  def render
    @grid.map { |row| row.map { |card| card.to_s }.join(" ") }.join("\n")
  end

  def won?
    @grid.all? {|row| row.all? {|card| card.display } }
  end

  def reveal(guessed_pos)
    card = @grid[guessed_pos[0]][guessed_pos[1]]
    card.reveal
    card.display
  end
end
