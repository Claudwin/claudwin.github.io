class LinkedList
  attr_accessor :first_node
  attr_accessor :last_node

  def add_node(value)
    new_node = LinkedListNode.new(value)

    # Only set first_node if it is not already set
    self.first_node ||= new_node

    if last_node
      last_node.next_node = new_node
    end

    self.last_node = new_node
  end

  # default parameter set to @first_node, allowing this method to be invoked
  #  from users of the LinkedList class by calling #print_values with no parameters
  def print_values(list_node=first_node)
    if list_node
      print "#{list_node.value} --> "
      print_values(list_node.next_node)
    else
      print "nil\n"
      return
    end
  end
end

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.add_node(12)
list.add_node(99)
list.add_node(37)
# Passing no parameters to print_values causes the LinkedList class to use the first_node in the list
list.print_values