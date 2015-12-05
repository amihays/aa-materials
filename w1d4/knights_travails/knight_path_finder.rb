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
         .select { |new_pos| new_pos.all? { |el| el > 0 } }
  end

  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos).reject { |pos2| @visited_positions[pos2] }
    new_positions.each {|pos2| @visited_positions[pos2] = true }
    new_positions
  end

  def build_move_tree

  end
end

kpf = KnightPathFinder.new([4, 4])
p kpf.new_move_positions([4, 4])
