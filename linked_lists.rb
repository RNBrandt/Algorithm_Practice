

#Challenge 1 create an algorithm which will find the nth from the end node of a linked list.
#method, create a pointer which will be created -n nodes from a lead pointer.
#edges 1) If there aren't n nodes

#Challenge two, make a Balanced Binary Search tree out of a sorted DLL
class Node
 attr_accessor :next
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
      p "This is the lead_pointer value: #{lead_pointer.value}"
      p "This is the counter: #{counter}"
    end
    following_pointer = @head
    until !lead_pointer.bigger
      p "This is the lead_pointer value: #{lead_pointer.value}"
      p "This is the following_pointer value: #{following_pointer.value}"
      lead_pointer = lead_pointer.bigger
      following_pointer = following_pointer.bigger
    end
    return following_pointer.value
  end
end

class BST
  def initialize
    @root = nil
  end

  def insert(node)
    if !@root
      @root = node
    end
    queue = [@root]
    while queue.length
      current  = queue.shift
      # If I've done this right, the first layer of if statement shouldn't be needed
      if node.value < current.value
        if !current.smaller
          current.smaller = node
        else
          queue.push(current.smaller)
        end
      else
        if !current.bigger
          current.bigger = node
        else
          queue.push(current.bigger)
        end
      end
    end
  end

  def break_sorted_linked_list(sll)
    #this will take a sorted linked list and create a queue of nodes to be passed into the next program
  end


end


test = Linked_list.new
test.add_node(1)
test.add_node(2)
test.add_node(3)
test.add_node(4)
test.add_node(5)
test.add_node(6)
test.add_node(7)
test.add_node(8)
p test.find_nth_from_end(1)



