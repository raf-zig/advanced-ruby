class Node
  attr_accessor :value, :next_node
  def initialize (value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail
  # @head - the first node of the list
  # @tail - the last node of the list
  def initialize(value)
    node = Node.new(value)
    @head = node
    @tail = node
  end

  def append(value)
    node = Node.new(value)
    # the pointer to the next node in the list is called at the last node in the list
    # and a new node is assigned to it
    @tail.next_node = node
    # the last node in the list becomes the new node
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head
    @head = node
  end
end
