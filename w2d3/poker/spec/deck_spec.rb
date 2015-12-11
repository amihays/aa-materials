require "rspec"
require "deck"

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "builds deck of 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
  end
end
