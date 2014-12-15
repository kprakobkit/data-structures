require_relative '../node'

describe Node do
  let(:node) { Node.new(1) }
  let(:next_node) { Node.new('some value') }

  describe '#new' do
    it 'should create an instance of Node' do
      expect(node).to be_a Node
    end
  end

  describe '#insert_after' do
    it 'should insert a node to the pointer property' do
      node.insert_after(next_node)
      expect(node.pointer).to be next_node
    end
  end

  describe '#remove_after' do
    it 'should remove the node at the pointer property' do
      node.insert_after(next_node)
      node.remove_after
      expect(node.pointer).to be_nil
    end
  end
end
