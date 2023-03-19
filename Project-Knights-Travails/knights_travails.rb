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
      
    end
  end
  
end