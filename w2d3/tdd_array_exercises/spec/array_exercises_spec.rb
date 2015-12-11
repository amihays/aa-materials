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

    it "sets target value to zero when none is given" do
      expect([3,2,1,-1,2,3].two_sum).to eq([[2,3]])
    end
  end

  describe "#my_transpose" do
    subject { [[1,2,3],[4,5,6],[7,8,9]] }
    
    it "transposes an empty matrix" do
      expect([].my_transpose).to eq([])
    end

    it "transposes a matrix with one row and one column" do
      expect([[1]].my_transpose).to eq([[1]])
    end

    it "transposes a matrix with multiple rows and columns" do
      expect(subject.my_transpose).to eq([[1,4,7],[2,5,8],[3,6,9]])
    end

    it "doesn't modify the original matrix" do
      subject.my_transpose
      expect(subject).to eq([[1,2,3],[4,5,6],[7,8,9]])
    end
  end
end
