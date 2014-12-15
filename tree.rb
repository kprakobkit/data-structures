require_relative 'tree_node'

class Tree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def search(search_value)
    node_list = [@root]

    until node_list.empty?
      current_node = node_list.pop
      return true if current_node.value == search_value

      unless current_node.children.empty?
        current_node.children.each do |children|
          node_list << children
        end
      end
    end

    false
  end
end
