class Node
  attr_accessor :pointer, :value

  def initialize(value, pointer = nil)
    @value = value
    @pointer = pointer
  end

  def insert_after(other_node)
    @pointer = other_node
  end

  def remove_after()
    @pointer = nil
  end
end
