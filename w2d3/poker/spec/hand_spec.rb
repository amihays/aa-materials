require "rspec"
require "hand"

describe Hand do
  let(:cards) {[Card.new(:four, :spade),
                Card.new(:ace, :heart),
                Card.new(:four, :diamond),
                Card.new(:seven, :club),
                Card.new(:queen, :spade)]}
  subject(:hand) { Hand.new(cards) }

  describe "#initialize" do
    it "accepts five cards" do
      expect(hand.cards).to eq(cards)
    end
  end

  describe "#swap" do
    let(:lose_cards) { cards[0..1] }
    let(:new_cards) { [Card.new(:king, :diamond),
                        Card.new(:three, :diamond)] }

    it "discards correct cards" do
      hand.swap(lose_cards, new_cards)
      expect(hand.cards).to_not include(*lose_cards)
    end

    it "receives new cards" do
      hand.swap(lose_cards, new_cards)
      expect(hand.cards).to include(*new_cards)
    end
  end
end
