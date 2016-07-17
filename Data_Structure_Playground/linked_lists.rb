

#Challenge 1 create an algorithm which will find the nth from the end node of a linked list.
#method, create a pointer which will be created -n nodes from a lead pointer.
#edges 1) If there aren't n nodes

#Challenge two, make a Balanced Binary Search tree out of an  un-sorted DLL
require_relative 'node_sorter'

class Node
 attr_accessor :bigger, :smaller
 attr_reader :value
  def initialize(value)
    @value = value
    @bigger = nil
    @smaller = nil
  end
end

class Linked_list < Node_sorter
  attr_accessor :tail, :head
  attr_reader :list_length
  def initialize
    @tail = nil
    @head = nil
  end

  def add_unordered_node(value)
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

  def add_ordered_node(value)
    node = Node.new(value)
    if !@tail
      @tail = node
      @head = node
    elsif node.value =< @head.value
      temp = @head
      node.bigger = temp
      temp.smaller = node
      @head = node
    else
      until current.value <= node.value
        current = current.bigger
      end
      node.smaller = current.smaller
      node.bigger = current
      current.smaller = node
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

