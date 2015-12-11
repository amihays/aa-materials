class Game
  attr_reader :stacks

  def initialize
    @stacks = [[3,2,1],[],[]]
  end

  def move(from_stack, to_stack)
    if stacks[from_stack].empty?
      raise "Cannot disc move from an empty stack"
    elsif !stacks[to_stack].empty? && stacks[to_stack].last < stacks[from_stack].last
      raise "Cannot move larger disc onto smaller disc"
    end
    stacks[to_stack].push(stacks[from_stack].pop)
  end
end
