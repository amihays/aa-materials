require_relative "../poly_tree_node/lib/00_tree_node"

DIFFS = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [1, 2], [1, -2], [2, -1], [2, 1]]

class KnightPathFinder
  def initialize(starting_pos)
    @starting_pos = PolyTreeNode.new(starting_pos)
    @visited_positions = { starting_pos => true }
    build_move_tree
  end

  def self.valid_moves(pos)
    DIFFS.map { |diff| [pos[0] + diff[0], pos[1] + diff[1]] }
         .select { |new_pos| new_pos.all? { |el| el > 0 && el < 8} }
  end

  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos)
                                    .reject { |node| @visited_positions[node] }
                                    .map { |pos| PolyTreeNode.new(pos) }
    new_positions.each {|node| @visited_positions[node.value] = true }
    new_positions
  end

  def build_move_tree
    move_tree = []
    position_queue = [@starting_pos]
    until position_queue.empty?
      current_node = position_queue.shift
      move_tree.push(current_node)
      p current_node
      position_queue.concat(new_move_positions(current_node.value))
    end
    move_tree
  end
end

kpf = KnightPathFinder.new([4, 4])
p kpf.build_move_tree
