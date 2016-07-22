#Challenge 1 create an algorithm which will find the nth from the end node of a linked list.
#method, create a pointer which will be created -n nodes from a lead pointer.
#edges 1) If there aren't n nodes

#Challenge two, make a Balanced Binary Search tree out of an  un-sorted DLL
require_relative 'node_sorter'

class Linked_list < Node_sorter
  attr_accessor :tail, :root
  attr_reader :list_length
  def initialize
    @tail = nil
    @root = nil
  end

  def add_unordered_node(node)
    if node.is_a?(Integer)
      node = Node.new(node)
    end
    # node = Node.new(value)
    if !@tail
      @tail = node
      @root = node
    else
      @tail.bigger = node
      node.smaller = @tail
      @tail = node
    end
  end

  def add_ordered_node(value)
    # node = Node.new(value)
    if !@tail
      @tail = node
      @root = node
    elsif node.value <= @root.value
      temp = @root
      node.bigger = temp
      temp.smaller = node
      @root = node
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
    lead_pointer = @root
    counter = 2
    (n-1).times do
      lead_pointer = lead_pointer.bigger
      if (lead_pointer == @tail) && (counter != n)
        return "There aren't #{n} values"
      end
      counter +=1
    end
    following_pointer = @root
    until !lead_pointer.bigger
      lead_pointer = lead_pointer.bigger
      following_pointer = following_pointer.bigger
    end
    return following_pointer.value
  end
end
