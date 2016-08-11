require_relative 'node'
class Node_sorter < Node
  def break_nodes
    #this will take an unsorted linked list and create a queue of nodes to be passed into the next program
    current = @root
    node_array = []
    counter = 0
    while current
      if current.bigger
        temp = current
        node_array << temp
        current = current.bigger
        temp.smaller = nil
        temp.bigger = nil
      else
        current.smaller = nil
        node_array << current
        break
      end
    end
    node_array
  end

  def sort_unsorted_node_array
    if self.length <=1
      return usna
    end
    mid = (usna.length)/2
    left = usna.slice(0...mid)
    right = usna.slice(mid..usna.length)
    return sort_helper(sort_unsorted_node_array(left), sort_unsorted_node_array(right))
  end

  def sort_helper(array_1, array_2)
    pointer_1 = 0
    pointer_2 = 0
    result = []
    if !array_1
      array_2
    elsif !array_2
      array_1
    end
    while array_1[pointer_1] && array_2[pointer_2]
      if array_1[pointer_1].value <= array_2[pointer_2].value
        result << array_1[pointer_1]
        pointer_1 +=1
      else
        result << array_2[pointer_2]
        pointer_2 +=1
      end
      if pointer_1 == array_1.length
        result = result.concat(array_2.slice(pointer_2..-1))
      elsif pointer_2 == array_2.length
        result = result.concat(array_1.slice(pointer_1..-1))
      end
    end
    result
  end
end
