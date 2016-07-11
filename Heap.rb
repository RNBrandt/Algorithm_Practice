class Heap
    def initialize
        # @elements is an array representing the tree
        # for each i:
        # parent => @elements[i / 2]
        # left => @elements[i * 2]
        # right => @elements[i * 2 + 1]
        @elements = []
    end

    def empty
        return @elements.count == 0
    end

    def pop_min
        value = @elements[0].first

        # Replace the [0]th element with the last one and bubble it down
        pair = @elements.pop

        # If it was the last element of the array, abort
        if @elements.count > 0
            @elements[0] = pair
            self.bubble_down(pair, 0)
        end

        return value
    end

    def peek_min
        return @elements[0].first
    end

    def push(object, order)
        # Put the element at the end of the array and bubble it up the tree
        offset = @elements.count
        pair = [object, order]
        @elements << pair

        self.bubble_up pair, offset
    end

    def bubble_up(pair, offset)
        # Push an element up the tree, if need be
        parent = offset / 2

        while (offset > 0 && @elements[parent].last > pair.last)
            @elements[parent], @elements[offset] = @elements[offset], @elements[parent]
            offset = parent
            parent = offset / 2
        end
    end

    def bubble_down(pair, offset)
        # Push an element down the tree if need be
        while (offset < @elements.count / 2)
            offset_a = offset * 2
            offset_b = offset_a + 1

            if @elements[offset_a].last > @elements[offset_b].last
                smallest = offset_b
            else
                smallest = offset_a
            end

            if pair.last <= @elements[smallest].last
                break
            end

            @elements[offset], @elements[smallest] = @elements[smallest], @elements[offset]
            offset = smallest
        end
    end
end

h = Heap.new

# Insert 'a' => 'o' in the heap, random order
h.push "g", 7
h.push "m", 13
h.push "k", 11
h.push "d", 4
h.push "c", 3
h.push "n", 14
h.push "b", 2
h.push "f", 6
h.push "a", 1
h.push "j", 10
h.push "i", 9
h.push "e", 5
h.push "o", 15
h.push "h", 8
h.push "l", 12
p h
h.pop_min
p h
