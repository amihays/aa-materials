require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    children = node.children
    
    result_node = children.find { |child| child.winning_node?(mark) }
    return result_node.prev_move_pos if result_node

    result_node = children.find { |kid| !kid.losing_node?(mark) }
    return result_node.prev_move_pos if result_node

    raise "Something went wrong - we can't lose!"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
