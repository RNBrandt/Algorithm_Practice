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
    self.bubble_up(@heap.length-1)
  end

  def bubble_up(index)
    if index%2 == 0
      parent_index = (index-2)/2
    else
      parent_index = (index-1)/2
    end
    # p "***************** PARENT INDEX#{@heap[parent_index]}"
    # p "***************** INDEX#{@heap[index]}"
    while @heap[parent_index] > @heap[index]
      self.swap(parent_index, index)
      index = parent_index
      if index%2 == 0
        parent_index = (index-2)/2
      else
        parent_index = (index-1)/2
      end
    end
  end

  def bubble_down(index)
      if find_children(index)
        #do logic
      else


  end

  def find_children(parent_index)
    # 1) there are no children indexes
    # 2) there is only one child index and the element at the child index does not need to be swapped
    # 3) there is only one child index and the element at the child index does need to be swapped
    # 4) there are two children indexes and neither need to be swapped
    # 5) there are two children indexes and one needs to be swapped
    # 6) there are two children indexes and both could be swapped, but you select the smaller one
    child_index_array =[]
    child_index_array << first_child_index = (parent_index *2) + 1
    child_index_array << (parent_index * 2) + 2
  end

end

test = Min_heap.new
test.insert(1)
test.insert(3)
test.insert(7)
test.insert(5)
test.insert(10)
test.insert(9)
test.insert(6)

p test
