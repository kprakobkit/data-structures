require_relative '../tree_list'
require_relative '../tree_list_node'

describe TreeList do
  let(:tree_list) { TreeList.new }

  describe '#new' do
    it 'should instantiate a new TreeList object' do
      expect(tree_list).to be_a TreeList
    end
  end

  describe '#add' do
    it 'should set the @root value to the specified value if the head is nil' do
      tree_list.add(4)
      expect(tree_list.root.value).to eq 4
    end

    it 'should add the element to the right child if the element is greater than the root value' do
      tree_list.add(4)
      tree_list.add(5)
      expect(tree_list.root.right.value).to eq 5
    end

    it 'should add the element to the left child if the element is less than the root value' do
      tree_list.add(4)
      tree_list.add(3)
      expect(tree_list.root.left.value).to eq 3
    end
  end

  describe '#find' do
    before :each do
      tree_list.add(4)
      tree_list.add(3)
    end

    it 'should return true when found' do
      expect(tree_list.find(4)).to eq true
      expect(tree_list.find(3)).to eq true
    end

    it 'should return false when not found' do
      expect(tree_list.find(2)).to eq false
      expect(tree_list.find(10)).to eq false
    end
  end
end
