require_relative '../tree_node'

describe TreeNode do
  let(:value) { 10 }
  let(:child_value) { 11 }
  let(:child_value2) { 12 }
  let(:tree_node) { TreeNode.new(value) }
  let(:child_node) { TreeNode.new(child_value) }
  let(:child_node2) { TreeNode.new(child_value2) }

  describe '#new' do
    it 'should create a TreeNode object' do
      expect(tree_node).to be_a TreeNode
    end

    it 'should set the value' do
      expect(tree_node.value).to eq value
    end
  end

  describe '#add_child' do
    it 'should add the child node to the parent node' do
      tree_node.add_child(child_node)
      expect(tree_node.children).to include(child_node)
    end
  end

  describe '#value' do
    it 'should return the value of the tree node' do
      expect(tree_node.value).to eq value
    end
  end

  describe 'children' do
    it 'should return a collection of child nodes' do
      tree_node.add_child(child_node)
      tree_node.add_child(child_node2)
      expect(tree_node.children).to be_a Array
      expect(tree_node.children).to include(child_node, child_node2)
    end
  end
end
