require_relative '../array_list'

describe ArrayList do
  size = 10
  let(:array_list) { ArrayList.new(size) }
  describe '#new' do
    it 'should create a new instance of ArrayList' do
      expect(array_list).to be_a ArrayList
    end
  end

  describe '#add' do
    it 'should add an element to the end of the list' do
      element = 'element'
      expect(array_list.add(element)).to eq element
    end
  end

  describe '#size' do
    it 'should return the size of the ArrayList' do
      expect(array_list.size).to eq size
    end
  end

  describe '#get' do
    it 'should return the element at given index' do
      array_list.add(2)
      last_index = array_list.size - 1
      expect(array_list.get(last_index)).to eq 2
    end

    it 'should return nil if index is out of bounds' do
      last_index = array_list.size - 1
      expect(array_list.get(last_index + 1)).to be nil
    end
  end

  describe '#set' do
    before(:each) do
      @index = 2
      @big_index = 15
      array_list.set('hello', @index)
      array_list.set('sawadee', @big_index)
    end

    it 'should set the element at given index (empty)' do
      expect(array_list.get(@index)).to eq 'hello'
      expect(array_list.get(@big_index)).to eq 'sawadee'
    end

    it 'should replace the element at given index' do
      array_list.set('world', @index)
      expect(array_list.get(@index)).to eq 'world'
    end
  end

  describe '#insert' do
    it 'should increase the array size by 1' do
      expect { array_list.insert('inserted', 2) }.to change { array_list.size }.by 1
    end

    it 'should insert the element at the given index (middle)' do
      array_list.set('before', 1)
      array_list.set('after', 2)
      array_list.insert('inserted', 2)
      expect(array_list.get(2)).to eq 'inserted'
      expect(array_list.get(1)).to eq 'before'
      expect(array_list.get(3)).to eq 'after'
    end

    it 'should insert the element at the given index (beginning)' do
      array_list.set('beginning', 0)
      array_list.set('last', array_list.size-1)
      array_list.insert('inserted', 0)
      expect(array_list.get(0)).to eq 'inserted'
      expect(array_list.get(1)).to eq 'beginning'
      expect(array_list.get(array_list.size-1)).to eq 'last'
    end
  end
end
