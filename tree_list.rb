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

  def greatest_sum
    return unless @root
    left_nodes = [@root.left]
    left_total = 0
    right_nodes = [@root.right]
    right_total = 0

    unless @root.left.nil?
      until left_nodes.empty?
        current_node = left_nodes.shift
        left_total += current_node.value
        left_nodes.push(current_node) if current_node.left
        left_nodes.push(current_node) if current_node.right
      end
    end

    unless @root.right.nil?
      until right_nodes.empty?
        current_node = right_nodes.shift
        right_total += current_node.value
        right_nodes.push(current_node.left) if current_node.left
        right_nodes.push(current_node.right) if current_node.right
      end
    end

    [left_total, right_total].max + @root.value
  end
end
