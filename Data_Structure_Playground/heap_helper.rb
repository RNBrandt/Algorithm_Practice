require_relative 'linked_lists'
require_relative 'node'
class Heap
#   overall will be an array
  attr_accessor :heap
  def initialize()
    @heap = []
  end

  def swap(index_1, index_2)
    temp =  @heap[index_1]
    @heap[index_1] = @heap[index_2]
    @heap[index_2] = temp
  end

  def insert(value)
    node = Node.new(value)
    @heap << node
    bubble_up(@heap.length-1)
  end

  def find_parent(index)
    if index%2 == 0
      parent_index = (index-2)/2
    else
      parent_index = (index-1)/2
    end
  end

  def bubble_down(index)
    while find_child_to_swap(index)
      child_index = find_child_to_swap(index)
      swap(child_index, index)
      index = child_index
    end
  end

  def find_child_to_swap(parent_index)
    first_child_index = (parent_index *2) + 1
    second_child_index = (parent_index * 2) + 2
    if child_index = compare_children(first_child_index, second_child_index)
      compare_parent_child(parent_index, child_index)
    end
  end

  def remove_top
    swap(0,@heap.length-1)
    top = @heap.pop
    bubble_down(0)
    top
  end

  def peek
    @heap[0]
  end
end
