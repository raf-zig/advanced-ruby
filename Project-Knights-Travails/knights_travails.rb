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
      current.children = possible_moves(current.position)

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

  def possible_moves(position)
    moves = []
    moves << [position[0] + 2, position[1] + 1]
    moves << [position[0] + 2, position[1] - 1]
    moves << [position[0] - 2, position[1] + 1]
    moves << [position[0] - 2, position[1] - 1]
    moves << [position[0] + 1, position[1] + 2]
    moves << [position[0] + 1, position[1] - 2]
    moves << [position[0] - 1, position[1] + 2]
    moves << [position[0] - 1, position[1] - 2]
    moves.select { |move| valid_move?(move) }.map { |move| Knight.new(move) }
  end

  def valid_move?(move)
    move[0].between?(0, 7) && move[1].between?(0, 7)
  end
end