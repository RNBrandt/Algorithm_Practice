#This should take the functions and return the data structure requested
# 1) determine what the data type is
# 2) ask user what data structure they want in return
require_relative "min_heap"
require_relative 'max_heap'
require_relative 'linked_lists'
require_relative 'Binary_search_tree'

class Creator
  def initialize(input)
    # input = $stdin.gets.chomp.to_i
    # p input
    if input.is_a?(Integer)
    # when input == 1
      # p "#{input}"
      node = Node.new(input)
      node_placer(node)
    # when input.is_a?(Array)
  elsif input.is_a?(Array)
    #   @array = input
    # when input.is_a?(Max_heap)
    #   @max_heap = input
    # when input.is_a?(Min_heap)
    #   @min_heap = input
    # when input.is_a?(Linked_list)
    #   @linked_list = input
    # when input.is_a?(Node)
    #   node = input
    #   node_placer(node)
    else
      p 'invalid data type'
    end
  end

  def node_placer(node)
    p "What would you like to do with this value (please enter the appropriate letter e.g. a )"
    p "a) Create new unsorted linked list"
    p "b) Add to an unsorted linked list"
    p "c) Create new sorted linked list"
    p "d) Add to an existing sorted linked list"
    p "e) Create a new Binary Search Tree"
    p "f) Add to an existing Binary Search Tree"
    p "g) Create a new min heap"
    p "h) Add to an existing min heap"
    user_input = $stdin.gets.chomp
    p node_case(user_input, node)
  end
  def node_case(user_input, node)
    case user_input
      when "a"
       temp = Linked_list.new
       temp.add_unordered_node(node)
      when "b"
        p "please input the linked list to be added"
        ull = $stdin.gets.chomp
        ull.add_unordered_node(node)
      when "c"
        Linked_list.new(node)
      when "d"
        p "please input the linked list to be added"
        oll = $stdin.gets.chomp
        oll.add_ordered_node(node)
      when "e"
        sorted_queue = [node]
        Bst.new(sorted_queue)
      when "f"
        p "please input the Binary search tree to be added to"
        input = $stdin.gets.chomp
        bst = input
        future_bst = Bst.new
        unsorted_node_array =  future_bst.break_nodes(bst)
        sorted_array = future_bst.sort_unsorted_node_array(unsorted_node_array)
        sorted_queue = future_bst.arrange_wrapper(sorted_array)
        future_bst.insert(sorted_queue)
      when "g"
        temp = Heap.new()
        temp.insert(node)
      when "h"
        p "Please input the min heap you to be added"
        input = $stdin.gets.chomp
        input.insert(node)
      else
        p "please input a valid option "
        user_input = $stdin.gets.chomp
        node_case(user_input, node)
      end
    end
end
pretend = Linked_list.new
pretend.add_unordered_node(3)
pretend.add_unordered_node(5)
test = Creator.new(1)
