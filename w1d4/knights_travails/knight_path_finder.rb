require_relative "../poly_tree_node/lib/00_tree_node"


class KnightPathFinder
  def initialize(starting_pos)
    @starting_pos = starting_pos
    @visited_positions = { starting_pos => true }
    build_move_tree
  end

  def find_path(end_pos)
    end_node = root_node.dfs(end_pos)

    path = []
    current_node = end_node
    until current_node.nil?
      path.unshift(current_node)
      current_node = current_node.parent
    end

    path.map{ |node| node.value.join(",") }.join(" => ")
  end

  private
  attr_accessor :root_node
  DIFFS = [[-2, 1], [-2, -1], [-1, 2], [-1, -2],
           [1, 2], [1, -2], [2, -1], [2, 1]]

  def self.valid_moves(pos)
    DIFFS.map { |diff| [pos[0] + diff[0], pos[1] + diff[1]] }
         .select { |new_pos| new_pos.all? { |el| el >= 0 && el < 8} }
  end

  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos)
                                    .reject { |node| @visited_positions[node] }
    new_positions.each {|pos| @visited_positions[pos] = true }
    new_positions
  end

  def build_move_tree
    self.root_node = PolyTreeNode.new(@starting_pos)
    position_queue = [root_node]
    until position_queue.empty?
      current_node = position_queue.shift
      new_move_positions(current_node.value).map do |pos|
        node = PolyTreeNode.new(pos)
        current_node.add_child(node)
        position_queue << node
      end
    end
  end
end
