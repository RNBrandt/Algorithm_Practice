#This should take the functions and return the data structure requested
# 1) determine what the data type is
# 2) ask user what data structure they want in return
require_relative

class Creator
  def initialize(input)
    case input
    when input.is_a?(Integer)
      node = Node.new(input)
      node_placer(node)
    when input.is_a?(Array)
      @array = input
    when input.is_a?(Max_heap)
      @max_heap = input
    when input.is_a?(Min_heap)
      @min_heap = input
    when input.is_a?(Linked_list)
      @linked_list = input
    when input.is_a?(Node)
      node = input
      node_placer(node)
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
    p "g) Create a new min or max heap"
    p "h) Add to an existing min or max heap"
    user_input = $stdin.gets.chomp
  end
  def node_case(user_input)
    case user_input
      when "a"
      when "b"
      when "c"
      when "d"
      when "e"
      when "f"
      when "g"
      when "h"
      else
        p "please input a valid option "
        user_input = $stdin.gets.chomp
        node_case(user_input)
    end
end
