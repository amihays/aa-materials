require "rspec"
require "deck"

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "builds deck of 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
  end

  describe "#draw" do
    it "returns an array of cards" do
      expect(deck.draw).to be_an(Array)
      expect(deck.draw.first).to be_a(Card)
    end

    it "draws one card when no argument is given" do
      expect(deck.draw.length).to be(1)
    end

    it "draws a number of cards when a number is given" do
      expect(deck.draw(5).length).to be(5)
    end

    it "throws an error when too many cards are drawn" do
      expect { deck.draw(53) }.to raise_error("Not enough cards in deck")
    end
  end

  describe "#shuffle!" do
    it "shuffles the deck of cards" do
      first_five_cards = deck.cards[0..5]
      deck.shuffle!
      expect(deck.cards[0..5]).to_not eq(first_five_cards)
    end
  end
end
