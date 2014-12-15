require_relative '../linked_list'

describe LinkedList do
  let(:linked_list) { LinkedList.new }
  describe '#new' do
    it 'should create a new instance of LinkedList' do
      expect(linked_list).to be_a LinkedList
    end
  end

  describe '#insert_first' do
    before :each do
      linked_list.insert_first('first')
      linked_list.insert_first('second')
    end

    it 'should insert an element at head position' do
      expect(linked_list.head.value).to eq 'second'
    end

    it 'new head should point to the first head' do
      expect(linked_list.head.pointer.value).to eq 'first'
    end
  end

  describe '#remove_first' do
    context 'when head position is nil' do
      it 'should return nil' do
        expect(linked_list.remove_first).to be_nil
      end
    end

    context 'when there is only the head position' do
      it 'should remove the head position' do
        linked_list.insert_first('first')
        linked_list.remove_first
        expect(linked_list.head).to be_nil
      end
    end

    context 'when there is more than one node in the list' do
      it 'should shift the head.pointer to head' do
        linked_list.insert_first('first')
        linked_list.insert_first('second')
        linked_list.remove_first
        expect(linked_list.head.value).to eq 'first'
      end
    end
  end

  describe '#insert_last' do
    it 'should insert the element at the last position of the list' do
      linked_list.insert_first('before last')
      linked_list.insert_first('first')
      linked_list.insert_last('last')
      expect(linked_list.tail.value).to eq 'last'
    end
  end

  describe '#remove_last' do
    it 'should remove the element at the last position of the list' do
      linked_list.insert_first('before last')
      linked_list.insert_first('first')
      linked_list.insert_last('last')
      linked_list.remove_last
      expect(linked_list.tail.value).to eq 'before last'
    end

    it 'should remove the element at the last position of the list' do
      linked_list.insert_first('before last')
      linked_list.remove_last
      expect(linked_list.head).to be_nil
    end
  end

  describe '#size' do
    it 'should return the size of the linked list' do
      expect { linked_list.insert_first('before last') }.to change { linked_list.size }.by 1
      expect { linked_list.insert_last('last') }.to change { linked_list.size }.by 1
      expect { linked_list.remove_last }.to change { linked_list.size }.by -1
      expect { linked_list.remove_first }.to change { linked_list.size }.by -1
    end
  end

  describe '#get' do
    it 'should return element at the given index' do
      linked_list.insert_first('first')
      linked_list.insert_last('last')
      expect(linked_list.get(0).value).to eq 'first'
      expect(linked_list.get(1).value).to eq 'last'
      expect(linked_list.get(2)).to be_nil
    end

    context 'index is larger than size of array' do
      it 'should return nil' do
        linked_list.insert_first('first')
        linked_list.insert_last('last')
        expect(linked_list.get(2)).to be_nil
      end
    end
  end

  describe '#set' do
    it 'should set element at the given index' do
      linked_list.insert_first('first')
      linked_list.insert_last('last')
      linked_list.set(0, 'new first')
      expect(linked_list.get(0).value).to eq 'new first'
    end
  end
end
