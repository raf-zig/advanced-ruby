class Node
  attr_accessor :data, :left, :right

  def initialize(data, left, right)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root

  def initialize(arr)
    arr = arr.sort.uniq
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid  = arr.length / 2
    node  = Node.new(arr[mid])
    node.left = build_tree(arr[0...mid])
    node.right = build_tree(arr[mid + 1..)
    node
  end
  

 
end

