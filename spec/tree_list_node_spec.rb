require_relative '../tree_list_node'

describe TreeListNode do
  let(:value) { 'value' }
  let(:tree_list_node) { TreeListNode.new(value) }
  describe '#new' do
    it 'should instantiate a new TreeListNodeObject' do
      expect(tree_list_node).to be_a TreeListNode
    end
  end
end
