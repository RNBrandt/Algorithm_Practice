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
    # p temp.value
    @root = new_node
    new_node = temp
  end

  def insert(value)
    new_node = Node.new(value)
    if !@root
      if_blank(new_node)
    elsif new_node.value <= @root.value
      switch_root(new_node)
    end
    current=@root
    # p " this is the current before attach ===#{current.value}"
    # p " this is the new_node before attach ===#{new_node.value}"
    if @size >= 1
      while current.right_child
        current = current.right_child
        # p " this is the current ===#{current.value}"
      end
      if !current.right_child
        right_leaf = current
        # p "right_leaf #{right_leaf} right_leaf value = #{right_leaf.value}"
        right_leaf.right_child = new_node
         # p "new_node #{new_node} new_node value = #{new_node.value}"
        @size += 1
        # if new_node != @root
          new_node.parent = right_leaf
        # end
      end
    else
      @size+= 1
    end
  end
end

  # def order
  #   current = @root
  #   if current.right_child
  #     current = current.right_child
  #   else
  #     working_node = current
  #   end
  #   if working_node.parent.value > working_node.value

  # end


 first = Node.new(1)


tree = Tree.new
tree.insert(1)
# p "THis is the tree #{tree}"
# p "This is the size of the tree #{tree.size}"
# p "THis is the root #{tree.root} this is root value #{tree.root.value}"

tree.insert(2)
p "THis is the parent of the root #{tree.root.parent}"
p "THis is the parent of the leaf #{tree.root.right_child.parent}"

# tree.insert(3)
# tree.insert(5)
# tree.insert(-1)
# tree
# right_branch = tree.root.right_child
#  right_leaf = right_branch.right_child
#  p right_branch.value
#  p right_leaf.value
#  p right_leaf.parent.value


