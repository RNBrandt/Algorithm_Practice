linked_lists.rb

#Challenge 1 create an algorithm which will find the nth from the end node of a linked list.
#method, create a pointer which will be created -n nodes from a lead pointer.
#edges 1) If there aren't n nodes
class Node
 attr_accessor :next
 attr_reader :value
  initialize(value)
    @value = value
    @next = nil
  end
end

class Linked_list
  attr_accessor :tail
  def initialize
    @tail = nil
  end

  def add_node(value)
    node = Node.new(value)
    if !@tail
      @tail= node
    else
      @tail.next = node
      @tail = node
end
