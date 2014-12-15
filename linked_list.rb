require_relative 'node'

class LinkedList
  attr_reader :head, :size

  def initialize
    @head = nil
    @size = 0
  end

  def insert_first(element)
    first_node = Node.new(element)
    old_head = @head
    @head = first_node
    @head.pointer = old_head
    @size += 1
  end

  def remove_first
    if @head
      @head = @head.pointer
      @size -= 1
    end
  end

  def insert_last(element)
    tail.pointer = Node.new(element)
    @size += 1
  end

  def get(index)
    return nil if @size < index
    traverse_to(index)
  end

  def set(index, element)
    traverse_to(index).value = element
  end

  def remove_last
    return remove_first if @head.pointer.nil?
    traverse_to(@size-2).pointer = nil if tail
    @size -= 1
  end

  def tail
    current_node = @head

    until current_node.pointer.nil?
      current_node = current_node.pointer
    end

    current_node
  end

  def traverse_to(index)
    current_node = @head
    current_index = 0

    while current_index < index
      current_node = current_node.pointer
      current_index += 1
    end

    current_node
  end
end
