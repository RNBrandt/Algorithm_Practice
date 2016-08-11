#This should take the functions and return the data structure requested
# 1) determine what the data type is
# 2) ask user what data structure they want in return
require_relative "min_heap"
require_relative 'max_heap'
require_relative 'linked_lists'
require_relative 'Binary_search_tree'

class Creator
  def initialize(input)
    if input.is_a?(Integer)
      node = Node.new(input)
      # node_placer(node)
    elsif input.is_a?(Array)
      @array = input
    elsif input.is_a?(Max_heap)
      @max_heap = input
    elsif input.is_a?(Min_heap)
      @min_heap = input
    elsif input.is_a?(Linked_list)
      @linked_list = input
    elsif input.is_a?(Node)
      node = input
      node_placer(node)
    else
      p 'invalid data type'
    end
  end

  def UO_linked_list_to_BST
    @Linked_list.break_nodes#.sort_unsorted_node_array(node_array)
  end
end
pretend = Linked_list.new
pretend.add_unordered_node(3)
pretend.add_unordered_node(5)
test = Creator.new(pretend)
p test.UO_linked_list_to_BST
# test.UO_linked_list_to_BST
