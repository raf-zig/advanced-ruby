class Node
  attr_accessor :value, :next_node
  def initialize (value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end
end
