class FixedArray
  attr_reader :size

  def initialize(size)
    @size = size
    @array = Array.new(size)
  end

  def set(element, index)
    outofbounds?(index)
    @array[index] = element
  end

  def get(index)
    outofbounds?(index)
    @array[index]
  end

  private

  def outofbounds?(index)
    raise IndexError if index < 0 || index >= size
  end
end
