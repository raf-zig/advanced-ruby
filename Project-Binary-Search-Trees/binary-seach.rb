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
  
  def insert(data, node = root)
    return Node.new(data) if node.nil?

    if data < node.data
      node.left = insert(data, node.left)
    elsif data > node.data
      node.right = insert(data, node.right)
    end
    node
  end
 
  def delete(data, node = root)
    return nil if node.nil?

    if data  < node.data
      node.left = delete(data, node.left)
    elsif data > node.data
      node.right = delete(data, node.right)
    else
    # node with only one child element or no child element
    return node.right if node.left.nil?
    return node.left if node.right.nil?

    # node with two child elements
    min_node = min_value_node(node.right)
    node.data = min_node.data
    node.right = delete(min_node.data, node.right)
    end
  end

  def min_value_node(node)
    current = node
    current = current.left until current.left.nil?
    current 
  end

  def find(data, node = root)
    return node if node.nil? || node.data == data

    if data < node.data
      find(data, node.left)
    elsif data > node.data
      find(data, node.right)
    end
  end

  def level_order(node = root)
    return nil if node.nil?

    queue = [node]
    result = []
    until queue.empty?
      current = queue.shift
      result << current.data
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?  
      end
    end
    result
  end
  
  def inorder(node = root, result = [])
    return result if node.nil?

    inorder(node.left, result)
    result << node.data
    inorder(node.right, result)

    result
  end

  def preorder(node = root, result = [])
    return result if node.nil?

    result << node.data
    preorder(node.left, result)
    preorder(node.right, result)

    result
  end

  def postorder(node = root, result = [])
    return result if node.nil?

    postorder(node.left, result)
    postorder(node.right, result)
    result << node.data

    result
  end
end

