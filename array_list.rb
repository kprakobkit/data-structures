require_relative 'fixed_array'

class ArrayList
  attr_accessor :size

  def initialize(size)
    @list = FixedArray.new(size)
    @size = @list.size
  end

  def add(element)
    last_index = @size
    increase_size_by_one
    @list.set(element, last_index)
  end

  def get(index)
    @list.get(index) unless index >= @size
  end

  def set(element, index)
    double_size if index >= @size
    @list.set(element, index)
  end

  def insert(element, index)
    increase_size_by_one
    reposition_list_starting_at(index)
    @list.set(element, index)
  end

  private

  def reposition_list_starting_at(index)
    current_index = @size-1

    while (current_index > index)
      previous_element = @list.get(current_index-1)
      @list.set(previous_element, current_index)
      current_index -= 1
    end
  end

  def double_size
    old_list = @list
    @list = FixedArray.new(@size * 2)
    @size = @list.size

    copy_list(old_list, @list)
  end

  def increase_size_by_one
    old_list = @list
    @list = FixedArray.new(@size + 1)
    @size = @list.size

    copy_list(old_list, @list)
  end

  def copy_list(old_list, new_list)
    old_list.size.times do |n|
      new_list.set(old_list.get(n), n)
    end
  end
end
