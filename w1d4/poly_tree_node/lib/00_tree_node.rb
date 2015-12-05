class PolyTreeNode
  attr_accessor :children
  attr_reader :parent, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent)
    unless @parent == parent
      @parent.children.delete(self) if @parent
      @parent = parent
      @parent.children.push(self) if @parent
    end
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    raise "That's not your child!" unless @children.include?(child)
    child.parent = nil
  end

  def dfs(target_value)
    return self if value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    node_queue = [self]
    until node_queue.empty?
      current_node = node_queue.shift
      return current_node if current_node.value == target_value
      node_queue.concat(current_node.children)
    end
    nil
  end
end
