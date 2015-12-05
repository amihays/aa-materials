require_relative "../poly_tree_node/lib/00_tree_node"

class KnightPathFinder
  def initialize(starting_pos)
    @starting_pos = PolyTreeNode.new(starting_pos)
    build_move_tree
  end

  def build_move_tree
  end
end

kpf = KnightPathFinder.new([0, 0])
