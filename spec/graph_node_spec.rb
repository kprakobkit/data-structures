require_relative '../graph_node'

describe GraphNode do
  let(:value) { 5 }
  let(:second_value) { 6 }
  let(:third_value) { 7 }
  let(:fourth_value) { 'fourth' }
  let(:fifth_value) { 'fifth' }
  let(:node) { GraphNode.new(value) }
  let(:second_node) { GraphNode.new(second_value) }
  let(:third_node) { GraphNode.new(third_value) }
  let(:fourth_node) { GraphNode.new(fourth_value) }
  let(:fifth_node) { GraphNode.new(fifth_value) }

  describe '#new' do
    it 'should create an instance of GraphNode' do
      expect(node).to be_a GraphNode
    end

    it 'should have the specified value (#value)' do
      expect(node.value).to eq value
    end
  end

  describe '#add_edge' do
    it 'should add another node to the current node\'s edge' do
      expect { node.add_edge(second_node) }.to change { node.nodes.size }.by 1
    end
  end

  describe '#exists?' do
    it 'should return true for nodes that are reachable from the current node' do
      node.add_edge(second_node)
      node.add_edge(third_node)
      third_node.add_edge(fourth_node)
      fourth_node.add_edge(fifth_node)

      expect(node.exists? { |node| node.value == 'fifth' } ).to be true
    end

    it 'should return false for nodes that aren\'t reachable from the current node' do
      node.add_edge(second_node)
      node.add_edge(third_node)
      fourth_node.add_edge(fifth_node)

      expect(node.exists? { |node| node.value == 'fifth' } ).to be false
    end
  end
end
