class HumanPlayer
  attr_accessor :previous_guess

  def initialize(name)
    @name = name
    @previous_guess = nil
  end

  def prompt(board)
    board.render
    puts "#{@name}, which card would you like to flip?"
  end

  def get_input
    gets.chomp.split(",").map{ |num| num.to_i }
  end

  def receive_revealed_card(pos, value)
  end

  def receive_match(pos1, pos2)
  end
end
