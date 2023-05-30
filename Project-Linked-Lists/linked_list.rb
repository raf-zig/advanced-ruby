# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
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
    return 'nil' if index > size - 1
    return @head.value if index.zero?

    current_node = @head
    index.times do
      current_node = current_node.next_node
    end

    current_node.value
  end

  def pop
    return unless size > 1

    current_node = @head
    current_node = current_node.next_node until current_node.next_node == @tail
    current_node.next_node = nil
    @tail = current_node
  end

  def contains?(value)
    current_node = @head
    until current_node.value == value
      return false if current_node.next_node.nil?

      current_node = current_node.next_node
    end
    true
  end

  def find(value)
    count = 0
    current_node = @head
    until current_node.value == value
      current_node = current_node.next_node
      return nil if current_node.next_node.nil?

      count += 1
    end
    count
  end

  def to_s
    current_node = @head
    print "( #{current_node.value} ) -> "
    until current_node.next_node.nil?
      current_node = current_node.next_node
      print "( #{current_node.value} ) -> "
    end
    print 'nil'
  end

  def insert_at(value, index)
    return puts 'Error: you selected an index outside of the list' if index > size

    count = 0
    current_node = @head
    until count == (index - 1)
      current_node = current_node.next_node
      count += 1
    end
    current_node_next = current_node.next_node
    new_node = Node.new(value)
    current_node.next_node = new_node
    new_node.next_node = current_node_next
    new_node
  end

  def remove_at(index)
    return puts 'Error: you selected an index outside of the list' if index > size

    count = 0
    current_node = @head
    until count == (index - 1)
      current_node = current_node.next_node
      count += 1
    end
    current_node_next = current_node.next_node
    current_node_next_next = current_node_next.next_node
    current_node.next_node = current_node_next_next
  end
end
