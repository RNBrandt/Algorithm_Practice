# Design a min heap, and a max heap.
# Over all design is a complete binary tree.
# Are useful for immediately grabbing the lowest or highest value of a group.
# initial creation may take O(n) time, but removal is O(1)
# Heaps have two functions insert and extract.
# You insert a value at the right-most leaf to ensure it remains a complete tree.
# Two classes should be built. Node and Tree.
# Node will contain the values, and the right and left children.
# Tree will evaluate the Nodes and reassign values as needed.

class Node
  attr_accessor :value, :left_child, :right_child, :parent
  def initialize(value)
    @value = value
    @parent = nil
    @right_child = nil
    @left_child = nil
  end
end

class Tree
  attr_accessor :root, :size
  def initialize()
    @root=nil
    @size = 0
  end

  def if_blank(new_node)
    @root = new_node
  end

  def switch_root(new_node)
    new_node.right_child = @root.right_child
    new_node.left_child = @root.left_child
    @root.parent = nil
    @root.right_child = nil
    @root.left_child = nil
    temp = @root
    @root = new_node
    return new_node = temp
  end
  def insert(value)
    new_node = Node.new(value)
    if !@root
      if_blank(new_node)
    end
    if @size >= 1
      right_leaf = get_to_bottom(@root)
      right_leaf.right_child = new_node
      @size += 1
      new_node.parent = right_leaf
    else
      @size+= 1
    end
    # add new method to bubble the value to the best place
  end
end

def get_to_bottom(root)
  current = root
  while current.right_child
    current = current.right_child
  end
  if !current.right_child
    return current
  end
end

def bubble(root)
  active = get_to_bottom(root)
  recrusive_call(active)
end
  # until active !parent call it recursively
  recrusive_call(node_to_be_checked)
    active = node_to_be_checked
    if (active.value < active.parent.value) && (!active.parent.left_child.left_child)
      # this means the nodes are at the leaves
      temp = active.parent
      if active.parent.left_child
        active.parent = temp.parent
        active.left_child = temp.left_child
        active.right_child = temp
        temp.parent = active
        # the next few lines need to be changed for this to work recursively on larger data sets
        temp.right_child = nil
        temp.left_child = nil
      else
        active.parent = temp.parent
        active.left_child = temp
        temp.parent = active
        # the next few lines need to be changed for this to work recursively on larger data sets
        temp.right_child = nil
        temp.left_child = nil
      end
    elsif (active.value < active.parent.value) && (active.parent.left_child.left_child)
      # this needs to be done in a way that will preserve all values
      parent_holder = active.parent
      active_holder = active
      if active.right_child
        active.parent = parent_holder.parent
        active.left_child = parent_holder.left_child
        active.right_child = parent_holder.right_child
        parent_holder.parent = active
        parent_holder.left_child = active_holder.left_child
        parent_holder.right_child = active_holder.right_child
        active_holder.right_child.parent = active_holder
        active_holder.left_child.parent = active_holder
      else
        active.parent = parent_holder.parent
        active.left_child = parent_holder.left_child
        active.right_child = parent_holder.right_child
        parent_holder.parent = active
        parent_holder.left_child = active_holder.left_child
        active_holder.left_child.parent = active_holder

    else

    else
      # do nothing

    recrusive_call(active)



    # I first need to see if parent has a left-hand value
    # if it doesn't that means the parent node needs to be the left_child of active
    # if it does, it can be the right_child.
  #is there another case I need to worry about?
    # Yes I need to make sure everything has it's own left_child
  else
    if !active.parent.left_child
      active.parent.right_child = nil
      active.parent.left_child = active
    end
    #order doesn't matter so long as the lowest value is always on top of the higher values,
end
  # def order
  #   while current.right_child
  #     current = current.right_child
  #   end
  #   if !current.right_child
  #     right_leaf = current
  #   end
  # end



first = Node.new(1)


tree = Tree.new
tree.insert(1)
# p "THis is the tree #{tree}"
# p "This is the size of the tree #{tree.size}"
# p "THis is the root #{tree.root} this is root value #{tree.root.value}"

tree.insert(2)
p "THis is the parent of the root #{tree.root.parent}"
p "THis is the parent of the first leaf #{tree.root.right_child.parent}"

tree.insert(3)
p "THis is the parent of the root #{tree.root.parent}"
p "THis is the parent of the second leaf #{tree.root.right_child.right_child.parent}"

tree.insert(5)
p "THis is the parent of the root #{tree.root.parent}"
p "THis is the parent of the third leaf #{tree.root.right_child.right_child.right_child.parent}"
p "THis is the child of the first leaf #{tree.root.right_child.right_child}"

tree.insert(-1)
p "THis is the parent of the root #{tree.root.parent}"
p "this is the value of the root #{tree.root.value}"
p "this is the value of the parent of the root #{tree.root.parent.value}"

# p tree
# right_branch = tree.root.right_child
#  right_leaf = right_branch.right_child
 # p right_branch.value
 # p right_leaf.value
 # p right_leaf.parent.value
 # p tree.root.parent.value


