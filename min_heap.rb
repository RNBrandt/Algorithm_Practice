# http://eloquentjavascript.net/1st_edition/appendix2.html

class Min_heap
#   overall will be an array
  attr_accessor :heap
  def initialize()
    @heap = []
  end

  # methods Insert, remove min (head), peek(see min element)

  # bubbleUp, bubbleDown, swap

  #Insert add element at the end of the array, and bubble up

  #remove SWAP the first element with the last, pop it off, and BUBBLE DOWN

  def swap(index_1, index_2)
    temp =  @heap[index_1]
    @heap[index_1] = @heap[index_2]
    @heap[index_2] = temp
  end

  def insert(value)
    @heap << value
    bubble_up(@heap.length-1)
  end

  def find_parent(index)
    if index%2 == 0
      parent_index = (index-2)/2
    else
      parent_index = (index-1)/2
    end
  end

  def bubble_up(index)
    parent_index = find_parent(index)
    until @heap[parent_index] <= @heap[index]
      swap(parent_index, index)
      index = parent_index
      parent_index = find_parent(index)
      if parent_index == -1
          break
      end
    end
  end

  def remove_min
    swap(0,@heap.length-1)
    min = @heap.pop
    bubble_down(0)
    min
  end

  def bubble_down(index)
    while find_child_to_swap(index)
      child_index = find_child_to_swap(index)
      swap(child_index, index)
      index = child_index
    end
  end

  def find_child_to_swap(parent_index)
    # 1) there are no children indexes
    # 2) there is only one child index and the element at the child index does not need to be swapped
    # 3) there is only one child index and the element at the child index does need to be swapped
    # 4) there are two children indexes and neither need to be swapped
    # 5) there are two children indexes and one needs to be swapped
    # 6) there are two children indexes and both could be swapped, but you select the smaller one
    first_child_index = (parent_index *2) + 1
    second_child_index = (parent_index * 2) + 2
    if child_index = compare_children(first_child_index, second_child_index)
      compare_parent_child(parent_index, child_index)
    end
  end

  def compare_children(first_child_index, second_child_index)
    if @heap[first_child_index] && @heap[second_child_index]
      if @heap[first_child_index] <= @heap[second_child_index]
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
    if @heap[parent_index] > @heap[child_index]
      child_index
    end
  end

end

test = Min_heap.new
test.insert(7)
test.insert(5)
test.insert(3)
p test.remove_min
test.insert(1)
test.insert(10)
test.insert(9)
test.insert(6)
p test
p test.remove_min
p test

