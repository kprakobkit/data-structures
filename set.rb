require_relative 'linked_list'

class MySet
  attr_accessor :collection

  def initialize
    @collection = LinkedList.new
  end

  def add(element)
    @collection.insert_first(element)
  end

  def remove(element)
  end
end
