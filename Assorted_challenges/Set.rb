# Properties for Set
#   - Set can only store unique values
#   - Neither arrays nor hashes can be used for the Set
#   - Elements are stored in nodes as part of linked lists (buckets)
#     - This allows collisions to happen without damaging the data-structure.
#     - Buckets are assigned  by taking the % of the ASCII value of the element, and number of buckets
#   - 8 buckets are instantiated at the creation of the set.
#   - Unique values (sometimes referred to as elements) can be added
#   - Repeat values cannot be added
#   - Values can be deleted
#   - When the number of elements > 75% of the number of buckets, the number of buckets will double, and the values will be redistributed among the new buckets.
#     - This minimizes collisions, and therefore, the time complexity
#    - When the number of elements falls below 25% of the number of buckets, the number of buckets will halve, and the values will be redistributed among the new buckets; however, there will never be fewer than 8 buckets in the Set.
#     - This works to increase storage efficiency


# TESTS TO FOLLOW FOR DEVELOPMENT

# Test for instantiation properties
#   test = Set.new
#   test.buckets (should == 8)
#   test.elements (should == 0)
#   test.is_present(element) (should == false regardless of element's value)

# Test for Linked List (bucket) Properties
#   test.bucket_0.value (should == nil)
#   test.bucket_0.head (should == nil)
#   test.bucket_0.tail (should == nil)
#   test.bucket_0.list_length (should == 0)

# Tests for insert method
#   test.insert(value) (should return no error)
#   test.is_present (value) (should == true)
#     test.elements (should == 1)
#     test.buckets (should == 8)
#   test.insert(repeat value) (should print error and not insert value)
#     test.elements (should == 1)
#     test.buckets (should == 8)
#   test.insert (values * 6) (should return no error)
#     test.elements (should == 7)
#     test.buckets (should == 16)
#   test.is_present(each value) (should == true)

# Tests for delete method (This is the same Set (7 elements and 16 buckets).)
#   test.delete(value (value has been previously inserted)) (should return no error)
#     test.is_present(value) (should return false)
#     test.elements (should return 6)
#     test.buckets (should return 16)
#   test.delete (value (value has not been previously inserted)) (should print error that value is not present in the set)
#     test.is_present(value) (should return false)
#     test.elements (should return 6)
#     test.buckets (should return 16)
#   test.delete(values * 3) (should return no error)
#     test.elements (should return 3)
#     test.buckets (should return 8)

class Set
  attr_reader :size, :elements, :number_of_buckets
  def initialize
    @number_of_buckets = 8
    buckets(@number_of_buckets)
    @elements = 0
  end

  def buckets(number_of_buckets)
    number_of_buckets.times do |index_number|
      string = index_number.to_s
      new_bucket = Linked_List.new
      set(string, new_bucket)
    end
  end

  def set(string, bucket_number)
    temp = "bucket#{string}_of_#{@number_of_buckets}"
    self.class.send(:attr_accessor, temp)
    self.instance_variable_set("@#{temp}", bucket_number)
  end

  def insert(key)
    # creating a dual naming scheme looses a bit of direct functionality, but it allows for a much more efficient reshuffling
    input_number = (key.ord % @number_of_buckets)
    bucket_var = "bucket#{input_number}_of_#{@number_of_buckets}"
    accessed = self.send bucket_var
    if accessed.contains(key)
      p "That value is already in this set"
      return
    else !accessed.contains(key)
      @elements +=1
      if !too_many_elements?
        accessed.append(key)
      else
        @elements -= 1
        shuffle_up
        insert(key)
      end
    end
  end

  def delete(key)
    input_number = (key.ord % @number_of_buckets)
    bucket_var = "bucket#{input_number}_of_#{@number_of_buckets}"
    accessed = self.send bucket_var
    if !accessed.contains(key)
      p "that value is not in the set"
    else
      accessed.delete(key)
      @elements -= 1
      if too_many_buckets?
        shuffle_down
      end
    end
  end

  def present?(key)
    input_number = (key.ord % @number_of_buckets)
    bucket_var = "bucket#{input_number}_of_#{@number_of_buckets}"
    accessed = self.send bucket_var
    if !accessed.contains(key)
      return false
    else
      return true
    end
  end

  def too_many_elements?
    if @elements > (@number_of_buckets *0.75)
      true
    else
      false
    end
  end

  def too_many_buckets?
    if (@number_of_buckets == 8) || (@elements > @number_of_buckets *0.25)
      false
    else
      true
    end
  end

  def shuffle_up
    temp = @number_of_buckets
    @number_of_buckets = @number_of_buckets *2
    buckets(@number_of_buckets)
    collect_old_elements(temp)
  end

  def shuffle_down
    temp = @number_of_buckets
    @number_of_buckets = @number_of_buckets/2
    buckets(@number_of_buckets)
    collect_old_elements(temp)
  end

  def collect_old_elements(old_number_of_buckets)
    i = 0
    while i < old_number_of_buckets
      old_bucket_var = "bucket#{i}_of_#{old_number_of_buckets}"
      accessed = self.send old_bucket_var
      if accessed.list_length > 0
        create_new_keys(accessed)
      end
      remove_instance_variable(:"@bucket#{i}_of_#{old_number_of_buckets}")
      i += 1
    end
  end

  def create_new_keys(ll_variable)
    while ll_variable.head
      ll_variable.list_length -= 1
      @elements -= 1
      insert(ll_variable.head.value)
      ll_variable.head = ll_variable.head.next
    end
  end

end

class Node
  attr_reader :value
  attr_accessor :next

  def initialize(val)
    @value = val
    @next = nil
  end
end

class Linked_List
  def initialize
    @head = nil
    @tail = nil
    @list_length = 0
  end

  attr_accessor :head, :tail, :list_length

  def append(val)
    new_node = Node.new(val)
    @list_length +=1
    if !@head
      @head = new_node
      @tail = @head
    elsif @head == @tail
      @head.next = new_node
      @tail = @head.next
    else
      temp = @tail
      temp.next = new_node
      @tail = temp.next
    end
  end

  def delete(key)
    if @head.value == key
      @list_length -= 1
      if !@head.next
        @head=nil
        @tail=nil
      else
        @head = @head.next
      end
    else
    traverse = @head
      if traverse.next.value ==(key)
        to_delete = traverse.next
        if to_delete.next
          traverse.next = to_delete.next
        else
          traverse.next = nil
          @tail = traverse
        end
      else traverse.next.value != (key)
        traverse = traverse.next
      end
    end
  end

  def contains(val)
    if !@head
      return false
    end
    traverse = @head
    while traverse.value != val
      if (!traverse.next)
        return false
      else
        traverse = traverse.next
      end
    end
    if traverse.value == val
      return true
    end
  end
end


# Driver code to follow the tests. I plan on implementing this in Rspec on Monday or Tuesday

test = Set.new
  p test.number_of_buckets
  p "should return 8"
  p test.elements
  p "should return 0"
  p test.present?("anything")
  p "should return false"
  p test.bucket0_of_8.head
  p "(should == nil)"
  p test.bucket0_of_8.tail
  p "(should == nil)"
  p test.bucket0_of_8.list_length
  p "(should == 0)"
  p test.insert("Reuben")
  p "(should return no error)"
  p test.present?("Reuben")
  p "(should == true)"
  p test.elements
  p "(should == 1)"
  p test.number_of_buckets
  p "(should == 8)"
  p test.insert("Reuben")
  p "(should print error and not insert value)"
  p test.elements
  p "(should == 1)"
  p test.number_of_buckets
  p "(should == 8)"
  test.insert("Nathaniel")
  test.insert("Brandt")
  test.insert("Is")
  test.insert("Great")
  test.insert("!")
  test.insert(3)
  p "(should return no error)"
  p test.elements
  p "(should == 7)"
  p test.number_of_buckets
  p "(should == 16)"
  p test.present?("Reuben")
  p "(Should == true)"
  p test.present?(3)
  p "(Should == true)"
  p test.delete(3)
  p "shouldn't return an error"
  p test.present?(3)
  p "Should return false"
  p test.elements
  p "should return 6"
  p test.number_of_buckets
  p "should return 16"
  test.delete("!")
  test.delete("Is")
  test.delete("Nathaniel")
  p "shouldn't return an error"
  p test.elements
  p "should == 3"
  p test.number_of_buckets
  p "should == 8"
  p test.present?("Reuben")
  p test.present?("Brandt")
  p test.present?("Great")
  p "all are true!!"
