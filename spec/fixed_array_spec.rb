require_relative '../fixed_array'

describe FixedArray do
  size = 10
  index = 1
  outofbound_index = 20
  element = 'element'
  let(:fixed_array) { FixedArray.new(size) }
  let(:set_element) { fixed_array.set(element, index) }
  let(:set_outofbound_element) { fixed_array.set(element, outofbound_index) }

  describe "new fixed array" do
    it "is an instance of Fixed Array" do
      expect(fixed_array).to be_a FixedArray
    end

    it "has a specified size" do
      expect(fixed_array.size).to eql size
    end
  end

  describe "#set" do
    it "can set value at a specified index" do
      expect(set_element).to eq element
    end

    it "cannot set value at an index that is out of bounds" do
      expect{ set_outofbound_element }.to raise_error IndexError
    end
  end

  describe "#get" do
    it "can get a value at a specfied index" do
      set_element
      expect(fixed_array.get(index)).to eq element
    end

    it "cannot get value at an index that is out of bounds" do
      expect { fixed_array.get(outofbound_index) }.to raise_error IndexError
    end
  end
end
