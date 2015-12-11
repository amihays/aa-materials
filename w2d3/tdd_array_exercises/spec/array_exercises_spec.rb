require "rspec"
require "array_exercises"

describe Array do
  describe "#my_uniq" do
    let(:unique) { [1,3,4,7,10] }
    let(:strings) { ["hi", "hi", "hello", "heya"] }
    let(:numbers) { [3,3,5,1,46,2,10] }

    it "returns an array" do
      expect([].my_uniq).to be_an(Array)
    end

    it "returns empty array when given an empty array" do
      expect([].my_uniq).to be_empty
    end

    it "returns the original array when array's elements are unique" do
      expect(unique.my_uniq).to eq(unique)
    end

    it "filters out repeated elements" do
      expect(numbers.my_uniq).to eq([3,5,1,46,2,10])
    end

    it "filters out repeated strings" do
      expect(strings.my_uniq).to eq(["hi", "hello", "heya"])
    end
  end

  describe "#two_sum" do
    it "returns an array" do
      expect([].two_sum).to be_an(Array)
    end

    it "returns an empty array when no pairs sum to target" do
      expect([100,300,20,15].two_sum(2)).to be_empty
    end

    it "returns a single pair when one exists" do
      expect([0,-5,5].two_sum(0)).to eq([[1,2]])
    end

    it "returns multiple pairs sorted correctly" do
      expect([3,2,1,-3,-4,-5,-3].two_sum(-2)).to eq([[0,5], [1,4], [2,3], [2,6]])
    end
  end

end
