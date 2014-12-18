require_relative 'tree_list_node'

class TreeList
  attr_reader :root

  def initialize
    @root = nil
  end

  def add(element, current_node = @root)
    return @root = TreeListNode.new(element) unless @root

    if element < current_node.value
      if current_node.left
        add(element, current_node.left)
      else
        current_node.left = TreeListNode.new(element)
      end
    else
      if current_node.right
        add(element, current_node.right)
      else
        current_node.right = TreeListNode.new(element)
      end
    end
  end

  def find(value)
    each { |element| return true if element == value }
    false
  end

  def each(node = @root, &block)
    each(node.left, &block) if node.left
    block.call(node.value)
    each(node.right, &block) if node.right
  end

  def greatest_sum(node = @root)
    return 0 if node == nil
    return node.value if node.left.nil? && node.right.nil?

    node.value + max(greatest_sum(node.left), greatest_sum(node.right))
  end

  private

  def max(*values)
    values.max
  end
end
