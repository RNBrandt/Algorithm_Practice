

#Challenge 1 create an algorithm which will find the nth from the end node of a linked list.
#method, create a pointer which will be created -n nodes from a lead pointer.
#edges 1) If there aren't n nodes
class Node
 attr_accessor :next
 attr_reader :value
  def initialize(value)
    @value = value
    @next = nil
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
      @tail.next = node
      @tail = node
    end
  end

  def find_nth_from_end(n)
    lead_pointer = @head
    counter = 2
    (n-1).times do
      lead_pointer = lead_pointer.next
      if (lead_pointer == @tail) && (counter != n)
        return "There aren't #{n} values"
      end
      counter +=1
      p "This is the lead_pointer value: #{lead_pointer.value}"
      p "This is the counter: #{counter}"
    end
    following_pointer = @head
    until !lead_pointer.next
      p "This is the lead_pointer value: #{lead_pointer.value}"
      p "This is the following_pointer value: #{following_pointer.value}"
      lead_pointer = lead_pointer.next
      following_pointer = following_pointer.next
    end
    return following_pointer.value
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
p test.find_nth_from_end(1)
