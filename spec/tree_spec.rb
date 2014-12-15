require_relative '../tree'
require_relative '../tree_node'

describe Tree do
  let (:root_node) { TreeNode.new('root node') }
  let (:tree) { Tree.new(root_node) }
  let (:test_tree) {
    foo = TreeNode.new('foo')
    bang = TreeNode.new('bang')
    bar = TreeNode.new('bar-box')
    baz = TreeNode.new('baz-box')
    bar.add_child(baz)
    foo.add_child(bang)
    foo.add_child(bar)

    Tree.new(foo)
  }

  describe '#new' do
    it 'should instantiate a new Tree object' do
      expect(tree).to be_a Tree
    end

    it 'should set the root as the given root' do
      expect(tree.root).to be root_node
    end
  end

  describe '#search' do
    it 'should return true if the node is in the tree' do
      expect(test_tree.search('baz-box')).to be true
      expect(test_tree.search('bar-box')).to be true
      expect(test_tree.search('foo')).to be true
    end

    it 'should return false if the node is not in the tree' do
      expect(test_tree.search('not in tree')).to be false
    end
  end
end

