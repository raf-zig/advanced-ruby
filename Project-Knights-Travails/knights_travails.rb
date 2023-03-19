class Knight
  attr_accessor :position, :parent, :children

  def initialize(position, parent = nil)
    @position = position
    @parent = parent
    @children = []
  end


end

class Board
  def knight_moves(start, finish)
    knight = Knight.new(start)
    queue = [knight]
    until queue.empty?
      current = queue.shift
      if current.position == finish
        return find_path(current)
      end
    end
  end

  def find_path(element)
    path = []
    while element
      path << element.position
      element = element.parent
    end
    path.reverse
  end


end