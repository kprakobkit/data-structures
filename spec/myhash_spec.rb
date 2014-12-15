require_relative '../myhash'

describe MyHash do
  let(:hash) { MyHash.new }

  describe '#new' do
    it 'should create a new instance of MyHash' do
      expect(hash).to be_a MyHash
    end
  end

  describe '#set' do
    it 'should set the key value pair' do
      hash.set('key', 'value')
      expect(hash.get('key')).to eq 'value'
    end
  end

  describe '#has_key?' do
    it 'should return true for a key that has been set' do
      hash.set('key', 'value')
      expect(hash.has_key?('key')).to eq true
    end

    it 'should return false for a key that has not been set' do
      expect(hash.has_key?('key')).to eq false
    end
  end

  describe '#remove' do
    it 'should remove the entry at the given key' do
      hash.set('key', 'value')
      hash.remove('key')
      expect(hash.has_key?('key')).to eq false
    end
  end
end
