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
    #fortunately most of that functionality is already in the methid
    @value = value
    stack = [@root]
    current = stack.pop
    checked = {}
    while stack.length > 0
      if current.val == @value
        p current
        break
      elsif current.leftChild && !checked[leftChild]
        if current.leftChild.val == @value
          p current.leftChild
        else
          checked[current.leftChild] = true
          stack << current.leftChild
      elsif current.rightChild && !checked[rightChild]
          if current.rightChild.val == @value
            p current.rightChild
          else
            checked[current.rightChild] = true
            stack << current.rightChild
          end
        end
      end
    end
  end
end
