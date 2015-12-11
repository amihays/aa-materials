class MoveError < StandardError
end

class Game
  attr_reader :stacks

  def initialize
    @stacks = [[3,2,1],[],[]]
  end

  def play
    until won?
      display
      play_turn
    end
    puts "You win!"
  end

  def display
    stacks.each_with_index do |stack, i|
      puts "Stack #{i}: #{stack.join(", ")}"
    end
  end

  def play_turn
    from_stack = prompt_from_stack
    to_stack = prompt_to_stack
    move(from_stack, to_stack)
  rescue MoveError => e
    puts e.message
    retry
  end

  def prompt_from_stack
    puts "Which stack would you like to move from?"
    gets.to_i
  end

  def prompt_to_stack
    puts "Which stack would you like to move to?"
    gets.to_i
  end

  def move(from_stack, to_stack)
    if stacks[from_stack].empty?
      raise MoveError, "Cannot disc move from an empty stack"
    elsif !stacks[to_stack].empty? &&
      stacks[to_stack].last < stacks[from_stack].last
      raise MoveError, "Cannot move larger disc onto smaller disc"
    end
    stacks[to_stack].push(stacks[from_stack].pop)
  end

  def won?
    stacks[1] == [3, 2, 1] || stacks[2] == [3,2,1]
  end
end

game = Game.new
game.play
