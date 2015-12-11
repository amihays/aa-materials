require "rspec"
require "towers_of_hanoi"

describe Game do
  subject(:game) { Game.new }

  describe "#initialize" do
    it "initializes with three piles" do
      expect(game.stacks.length).to eq(3)
    end

    it "initializes with full stack of towers on pile 1" do
      expect(game.stacks[0]).to eq([3, 2, 1])
    end
  end

  describe "#move" do
    it "raises an error when moving from an empty stack" do
      expect { game.move(1, 0) }.to raise_error("Cannot disc move from an empty stack")
    end
    
    it "moves a disc from a pile to an empty pile" do
      game.move(0, 1)
      expect(game.stacks).to eq([[3,2], [1], []])
    end

    it "raises an error when moving a disc onto a smaller disc" do
      game.move(0, 1)
      expect { game.move(0, 1) }.to raise_error("Cannot move larger disc onto smaller disc")
    end
  end
end
