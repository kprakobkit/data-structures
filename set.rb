require_relative 'array_list'

class MySet
  attr_accessor :collection
  attr_reader :size

  def initialize
    @collection = Array.new
    @size = 0
  end

  def add(element)
    unless contains?(element)
      @collection[hash_value(element)] = element
      @size +=1
    end
  end

  def remove(element)
    if contains?(element)
      @collection[hash_value(element)] = nil
      @size -= 1
    end
  end

  def iterate(&block)
    @collection.reject(&:nil?).each do |value|
      yield value
    end
  end

  def contains?(element)
    @collection.include?(element)
  end

  def hash_value(value)
    value.to_sym.object_id % 100
  end
end
