# Build an algorithm to find the first common ancestor of two nodes in a binary search tree
# implement a depth first search.
# record the values of the nodes on the way to the targets (array)
  # for this I will use a dynamic array, so the array is deleted if the target isn't reached
#compare the two, and find the last common value
class Node
  attr_accessor :val, :rightChild, :leftChild
  def initialize(val)
    @val = val
    @rightChild = nil
    @leftChild = nil
  end
end

class Binary_Search_Tree
  attr_reader :root, :size
  def initialize()
    @root = nil
    @size = 0
  end

  def insert(val)
    new_node = Node.new(val)
    @size += 1
    if @root == nil
      @root = new_node
      return
    end
    queue = [@root]
    while queue.length > 0
      # while there's a node in the queue do the following
      current = queue.shift
      if (new_node.val < current.val)
        if !current.leftChild
          current.leftChild = new_node
        else
          queue.push(current.leftChild)
        end
      elsif (new_node.val > current.val)
        if !current.rightChild
          current.rightChild = new_node
        else
          queue.push(current.rightChild)
        end
      end
    end
  end

  def depth_first(value)
    # Now that I've built this, I need to modify it to persist the path it took.
    #fortunately most of that functionality is already in the method
    @value = value
    stack = [@root]
    current = stack.pop
    checked = []
    while stack.length > 0
      if current.val == @value
        p current
        break
      elsif current.leftChild && !checked.includes?(current.leftChild)
        if current.leftChild.val == @value
          current.leftChild
        else
          checked << current.leftChild
          stack << current.leftChild
      elsif current.rightChild && !checked.includes?(current.rightChild)
          if current.rightChild.val == @value
            current.rightChild
          else
            checked << current.rightChild
            stack << current.rightChild
          end
        end
      end
      return checked
    end
  end

  def find_common_ancestor(first_value, second_value)
    first_checked = depth_first(first_value)
    second_checked = depth_first(second_value)
    final = []
    first_checked.each do |value|
      if second_checked.includes?(value)
        final << value
      end
    end
    final.pop
  end

end
