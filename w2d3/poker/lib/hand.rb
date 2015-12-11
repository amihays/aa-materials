require_relative "card"

class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def swap(old_cards, new_cards)
    @cards.reject! { |card| old_cards.include?(card) }
    @cards.concat(new_cards)
  end
end
