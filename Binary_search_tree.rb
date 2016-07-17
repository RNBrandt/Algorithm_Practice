require_relative'linked_lists'
require_relative'node_sorter'

class Bst < Node_sorter
  def initialize
    @root = nil
  end

  def insert(sorted_queue)
    sorted_queue.each do |node|
      p node
      if !@root
        @root = node
      end
      queue = [@root]
      while queue.length > 0
        current  = queue.shift
        # If I've done this right, the first layer of if statement shouldn't be needed
        if node.value < current.value
          if !current.smaller
            current.smaller = node
          else
            queue.push(current.smaller)
          end
        elsif (node.value > current.value)
          if !current.bigger
            current.bigger = node
          else
            queue.push(current.bigger)
          end
        end
      end
    end
  end

  def arrange_node_queue(sorted_array, queue)
    if sorted_array.length <=1
      return
    end
    mid = sorted_array.length/2
    left = sorted_array.slice(0...mid)
    right = sorted_array.slice(mid...sorted_array.length)
    queue << sorted_array[mid]
    arrange_node_queue(right, queue)
    arrange_node_queue(left, queue)
    queue
  end
private
  def arrange_wrapper(sorted_array)
    first = sorted_array[0]
    queue = arrange_node_queue(sorted_array,[])
    queue << first
    queue
  end
end
