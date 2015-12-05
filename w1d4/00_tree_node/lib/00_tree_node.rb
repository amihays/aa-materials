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
end
