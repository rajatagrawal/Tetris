module Tetris
  module Engine
    class Freeze

      def initialize(tetris_map)
        @tetris_map = tetris_map
      end

      def can_freeze_shape? shape
        shape.block_coordinates.each do |x,y, color|
          if reached_bottom_of_map?(y) || space_occupied?(x,y)
            return true
          end
        end
        return false
      end

      def freeze_shape shape
        shape.block_coordinates.each do |x,y,color|
          @tetris_map.map[x][y] = [false, color]
        end
      end

      private

      def reached_bottom_of_map?(y)
        (y + 1) > @tetris_map.height
      end

      def space_occupied?(x,y)
        @tetris_map.map[x][y+1][0] == false
      end
    end
  end
end
