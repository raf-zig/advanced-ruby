# frozen_string_literal: true

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
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

    mid = arr.length / 2
    node = Node.new(arr[mid])
    node.left = build_tree(arr[0...mid])
    node.right = build_tree(arr[mid + 1..])
    node
  end

  # pretty_print method that a student wrote and shared in the www.theodinproject.com
  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│ ' : ' '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? ' ' : '│ '}", true) if node.left
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

    if data < node.data
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

  def height(node = root)
    return 0 if node.nil?

    left = height(node.left)
    right = height(node.right)
    return left + 1 if left > right

    right + 1
  end

  def depth(node, current = root, level = 0)
    return level if node == current || current.nil?

    if node.data < current.data
      depth(node, current.left, level + 1)
    else
      depth(node, current.right, level + 1)
    end
  end

  def balanced?(node = root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    return false if (left_height - right_height).abs > 1

    balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    @root = build_tree(level_order)
  end
end

tree = Tree.new(Array.new(15) { rand(1..100) })
tree.pretty_print

puts "Level order: #{tree.level_order}"
puts "Inorder: #{tree.inorder}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"

puts "Height: #{tree.height}"
puts "Depth: #{tree.depth(tree.find(50))}"
puts "Balanced?: #{tree.balanced?}"
