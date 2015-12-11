require "card"
require "rspec"

describe Card do
  subject(:card) { Card.new(5, :spade) }

  describe "#initialize" do
    it "sets the value and suit" do
      expect(card.value).to eq(5)
      expect(card.suit).to eq(:spade)
    end
  end
end
