class Deck
  attr_reader :cards

  SUITS = ["spade", "heart", "club", "diamond"]

  def initialize
    build_cards
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
