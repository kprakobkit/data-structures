require_relative '../set'

describe MySet do
  let(:my_set) { MySet.new }
  let(:other_set) { MySet.new }

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
      expect(my_set.contains?('value1')).to be true
      expect(my_set.contains?('value2')).to be true
    end

    it 'should return false if the element is not in the collection' do
      expect(my_set.contains?('value3')).to be false
      expect(my_set.contains?('value4')).to be false
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

  describe 'operations' do
    before :each do
      (1..10).each do |num|
        my_set.add(num.to_s)
      end

      (1..10).select(&:odd?).each do |num|
        other_set.add(num.to_s)
      end
    end

    describe '#union' do
      it 'should return a new set that is the union of the two sets' do
        new_set = my_set.union(other_set)
        my_set.iterate do |element|
          expect(new_set.contains?(element)).to be true
        end
      end

      it 'should not return a list with duplicate values' do
        new_set = my_set.union(other_set)
        expect(new_set.size).to eq my_set.size
      end
    end

    describe '#intersection' do
      it 'should return a new set that is the intersection of the two sets' do
        intersection_set = my_set.intersection(other_set)
        intersection_set.iterate do |element|
          expect(other_set.contains?(element)).to be true
        end
        expect(intersection_set.size).to eq other_set.size
      end
    end

    describe '#difference' do
      it 'should return a new set that is the difference of the two sets' do
        difference_set = my_set.difference(other_set)
        difference_set.iterate do |element|
          expect(other_set.contains?(element)).to be false
        end
      end
    end

    describe '#subset?' do
      it 'should return true if the other set is a subset of set' do
        expect(my_set.subset?(other_set)).to be true
      end

      it 'should return false if the other set is not a subset of set' do
        not_subset_set = MySet.new
        not_subset_set.add('100')
        not_subset_set.add('200')
        expect(my_set.subset?(not_subset_set)).to be false
      end
    end
  end
end
