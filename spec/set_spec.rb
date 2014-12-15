require_relative '../set'

describe MySet do
  let(:my_set) { MySet.new }

  describe '#new' do
    it 'should create a an instance of MySet' do
      expect(my_set).to be_a MySet
    end
  end

  describe '#add' do
    it 'should add an element to the collection' do
      expect { my_set.add('value1') }.to change { my_set.size }.by 1
    end

    it 'should not add a new element if the element already exists' do
      my_set.add('value1')
      expect { my_set.add('value1') }.to_not change { my_set.size }
    end
  end

  describe '#remove' do
    before :each do
      my_set.add('value1')
      my_set.add('value2')
    end

    it 'should remove the element if the element is in the set' do
      my_set.add('value1')
      expect { my_set.remove('value1') }.to change { my_set.size }.by -1
    end


    it 'should not change the size of the set if the element does not exist' do
      expect { my_set.remove('value3') }.to_not change { my_set.size }
    end
  end

  describe '#contains?' do
    before :each do
      my_set.add('value1')
      my_set.add('value2')
    end

    it 'should return true if the element is already in the collection' do
      expect(my_set.contains?('value1')).to eq true
      expect(my_set.contains?('value2')).to eq true
    end

    it 'should return false if the element is not in the collection' do
      expect(my_set.contains?('value3')).to eq false
      expect(my_set.contains?('value4')).to eq false
    end
  end

  describe '#size' do
    before :each do
      my_set.add('value1')
      my_set.add('value2')
    end

    it 'should return the correct size' do
      expect(my_set.size).to eq 2
    end
  end
end
