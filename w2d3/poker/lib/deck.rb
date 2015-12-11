require_relative "card"

class Deck
  attr_reader :cards

  SUITS = ["spade", "heart", "club", "diamond"]

  def initialize
    build_cards
  end

  def draw(num = 1)
    raise "Not enough cards in deck" if cards.length < num
    draw_cards = []
    num.times { draw_cards << cards.pop }
    draw_cards
  end

  def shuffle!
    cards.shuffle!
  end

  private
  def build_cards
    @cards = []
    SUITS.each do |suit|
      (1..13).each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end
end
