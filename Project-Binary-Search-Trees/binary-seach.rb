class Node
  attr_accessor :data, :left_el, :right_el
  def initialize(data, left_el, right_el)
    @data = data
    @left_el = nil
    @right_el = nil
  end
end

class Tree
  attr_reader :root
  def initialize(arr)
    @arr = arr.sort.uniq
    
  end

  

 
end

