

#Challenge 1 create an algorithm which will find the nth from the end node of a linked list.
#method, create a pointer which will be created -n nodes from a lead pointer.
#edges 1) If there aren't n nodes

#Challenge two, make a Balanced Binary Search tree out of an  un-sorted DLL
class Node
 attr_accessor :bigger, :smaller
 attr_reader :value
  def initialize(value)
    @value = value
    @bigger = nil
    @smaller = nil
  end
end

class Linked_list
  attr_accessor :tail, :head
  attr_reader :list_length
  def initialize
    @tail = nil
    @head = nil
  end

  def add_node(value)
    node = Node.new(value)
    if !@tail
      @tail = node
      @head = node
    else
      @tail.bigger = node
      node.smaller = @tail
      @tail = node
    end
  end

  def find_nth_from_end(n)
    lead_pointer = @head
    counter = 2
    (n-1).times do
      lead_pointer = lead_pointer.bigger
      if (lead_pointer == @tail) && (counter != n)
        return "There aren't #{n} values"
      end
      counter +=1
    end
    following_pointer = @head
    until !lead_pointer.bigger
      lead_pointer = lead_pointer.bigger
      following_pointer = following_pointer.bigger
    end
    return following_pointer.value
  end
end

class Bst
  def initialize
    @root = nil
  end

  def insert(sorted_queue)
    sorted_queue.each do |node|
      p node
      if !@root
        @root = node
      end
      queue = [@root]
      while queue.length > 0
        current  = queue.shift
        # If I've done this right, the first layer of if statement shouldn't be needed
        if node.value < current.value
          if !current.smaller
            current.smaller = node
          else
            queue.push(current.smaller)
          end
        elsif (node.value > current.value)
          if !current.bigger
            current.bigger = node
          else
            queue.push(current.bigger)
          end
        end
      end
    end
  end

  def break_unsorted_linked_list(ll)
    #this will take an unsorted linked list and create a queue of nodes to be passed into the next program
    current = ll.head
    node_array = []
    counter = 0
    while current
      if current.bigger
        temp = current
        node_array << temp
        current = current.bigger
        temp.smaller = nil
        temp.bigger = nil
      else
        current.smaller = nil
        node_array << current
        break
      end
    end
    node_array
  end

  def sort_unsorted_node_array(usna)
    if usna.length <=1
      return usna
    end
    mid = (usna.length)/2
    left = usna.slice(0...mid)
    right = usna.slice(mid..usna.length)
    return sort_helper(sort_unsorted_node_array(left), sort_unsorted_node_array(right))
  end

  def sort_helper(array_1, array_2)
    pointer_1 = 0
    pointer_2 = 0
    result = []
    if !array_1
      array_2
    elsif !array_2
      array_1
    end
    while array_1[pointer_1] && array_2[pointer_2]
      if array_1[pointer_1].value <= array_2[pointer_2].value
        result << array_1[pointer_1]
        pointer_1 +=1
      else
        result << array_2[pointer_2]
        pointer_2 +=1
      end
      if pointer_1 == array_1.length
        result = result.concat(array_2.slice(pointer_2..-1))
      elsif pointer_2 == array_2.length
        result = result.concat(array_1.slice(pointer_1..-1))
      end
    end
    result
  end
  def arrange_node_queue(sorted_array, queue)
    if sorted_array.length <=1
      return
    end
    mid = sorted_array.length/2
    left = sorted_array.slice(0...mid)
    right = sorted_array.slice(mid...sorted_array.length)
    queue << sorted_array[mid]
    arrange_node_queue(right, queue)
    arrange_node_queue(left, queue)
    queue
  end

  def arrange_wrapper(sorted_array)
    first = sorted_array[0]
    queue = arrange_node_queue(sorted_array,[])
    queue << first
    queue
  end

  # def queue_helper(array_half)
  #   result = array_half.pop
  #   p array_half
  # end
end

def min_heap

end

def max_heap

end


test = Linked_list.new
test.add_node(7)
test.add_node(3)
test.add_node(1)
test.add_node(5)
test.add_node(4)
test.add_node(6)
test.add_node(2)
test.add_node(8)
test.find_nth_from_end(1)
# p test.head
search = Bst.new
test_array = search.break_unsorted_linked_list(test)
sorted_test = search.sort_unsorted_node_array(test_array)
bst_queue = search.arrange_wrapper(sorted_test)
p search.insert(bst_queue)
# p sorted_test


[1,2,3,4,5,6,7]
[2,3,4,5,6,7,8]

