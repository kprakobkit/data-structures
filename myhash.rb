require_relative 'linked_list'

class MyHash
  attr_accessor :collection

  def initialize
    @collection = Array.new
  end

  def set(key, value)
    @collection[hash_key(key)] = [key, value]
  end

  def get(key)
    @collection[hash_key(key)].last
  end

  def has_key?(key)
    !@collection[hash_key(key)].nil?
  end

  def remove(key)
    @collection[hash_key(key)] = nil
  end

  def iterate(&block)
    @collection.reject { |element| element.nil? }.each do |pair|
      yield pair.last, pair.first
    end
  end

  private

  def hash_key(key)
    key.to_sym.object_id % 100
  end
end

hash = MyHash.new
hash.set('key', 'value')
hash.set('key1', 'value1')
hash.set('key2', 'value2')
hash.set('key3', 'value3')

hash.iterate do |value, key|
  puts "value #{value}"
  puts "key #{key}"
end

