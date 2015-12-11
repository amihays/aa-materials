require "card"
require "rspec"

describe Card do
  subject(:card) { Card.new(:five, :spade) }

  describe "#initialize" do
    it "sets the value and suit" do
      expect(card.value).to eq(:five)
      expect(card.suit).to eq(:spade)
    end
  end
end
