# http://eloquentjavascript.net/1st_edition/appendix2.html
require_relative 'heap_helper'

class Min_heap < Heap
  def bubble_up(index)
    parent_index = find_parent(index)
    until @heap[parent_index].value <= @heap[index].value
      swap(parent_index, index)
      index = parent_index
      parent_index = find_parent(index)
      if parent_index == -1
          break
      end
    end
  end

  def remove_top
    swap(0,@heap.length-1)
    top = @heap.pop
    bubble_down(0)
    top
  end

  def compare_children(first_child_index, second_child_index)
    if @heap[first_child_index] && @heap[second_child_index]
      if @heap[first_child_index].value <= @heap[second_child_index].value
        child_index_to_swap = first_child_index
      else
        child_index_to_swap = second_child_index
      end
    elsif @heap[first_child_index]
      child_index_to_swap = first_child_index
    else child_index_to_swap = nil
    end
  end

  def compare_parent_child(parent_index, child_index)
    if @heap[parent_index].value > @heap[child_index].value
      child_index
    end
  end
end


