require_relative "00_tree_node"

class KnightPathFinder
    attr_reader :considered_positions, :root

    MOVES = [[-2, -1],[-2, 1],[-1, -2],[-1, 2],[1, -2],[1, 2],[2, -1],[2, 1]]

    def self.valid_moves(pos) #[-2, -1],[-2, 1],[-1, -2]
      valid = []

      x = pos[0]
      y = pos[1]

      MOVES.each do |arr| #[1,2]
        new_x = arr[0] + x
        new_y = arr[1] + y
        new_pos = [new_x, new_y]
        if (new_x >= 0 && new_x <= 7) && (new_y >= 0 && new_y <= 7)
            valid << new_pos
        end
      end

      valid
    end

    def initialize(pos)
      @root = PolyTreeNode.new(pos)
      @considered_positions = [pos] 
      self.build_move_tree
    end


    def new_move_positions(pos) 
      valid_pos = KnightPathFinder.valid_moves(pos)
      ult_pos = valid_pos.reject {|ele| @considered_positions.include?(ele)}
      @considered_positions += ult_pos
      ult_pos
    end

    def build_move_tree
      queue = [@root]

      until queue.empty?
        new_children = self.new_move_positions(queue.first.value) 
        new_children.each do |child|
          black_sheep = PolyTreeNode.new(child)
          queue.first.add_child(black_sheep)
          queue.push(black_sheep)
        end
        queue.shift
      end
    end
end

