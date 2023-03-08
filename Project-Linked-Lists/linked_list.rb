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

  def size
    count = 1
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    return 'nil' if index > self.size - 1
    if index == 0
      return @head.value
    end
    current_node = @head
    index.times do
      current_node.next_node
    end
    current_node.value
  end

  def pop
    if self.size != 1
      current_node = @head
      until current_node.next_node == @tail
        current_node = current_node.next_node
      end
      current_node.next_node = nil
      @tail = current_node
    end  
  end
  
end
