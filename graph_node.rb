class GraphNode
  attr_reader :nodes, :value

  def initialize(value)
    @value = value
    @nodes = []
  end

  def add_edge(other_node)
    @nodes.push(other_node)
  end

  def exists?(&block)
    unexplored = []
    explored = []
    @nodes.each { |node| unexplored.push(node) }

    until unexplored.empty?
      current_node = unexplored.shift
      explored.push(current_node)
      return true if yield current_node

      current_node.nodes.each do |node|
        unexplored.push(node) unless explored.include?(node)
      end
    end

    false
  end
end
