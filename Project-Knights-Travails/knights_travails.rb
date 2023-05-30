# frozen_string_literal: true

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
      return find_path(current) if current.position == finish

      current.children = possible_moves(current.position)
      current.children.each do |child|
        child.parent = current
        queue << child
      end
    end
  end

  def find_path(element)
    path = []
    while element
      path << element.position
      element = element.parent
    end
    path.reverse!
    puts "You made it in #{path.size} moves!  Here's your path:"
    path.each { |i| puts "#{i}\n" }
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
    move[0].between?(1, 8) && move[1].between?(1, 8)
  end
end

new_game = Board.new
new_game.knight_moves([1, 3], [8, 8])
