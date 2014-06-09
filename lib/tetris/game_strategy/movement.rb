module Tetris
  module GameStrategy
    class Movement

      def initialize(tetris_map, height, width)
        @map = tetris_map
        @height = height
        @width = width
      end

      def move_shape(direction, shape)
        if space_to_move?(direction, shape)
          shape.move(direction)
        end
      end

      def drop_shape(shape)
        while space_to_move?('down', shape) do
          shape.move('down')
        end
      end

      def space_to_move?(direction, shape)
        case direction
        when 'right'
          space_in_right?(shape)
        when 'left'
          space_in_left?(shape)
        when 'down'
          space_in_bottom?(shape)
        when 'up'
          false
        end
      end

      def space_in_bottom?(shape)
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0]
          y = coordinate[1] + 1

          if y > @height
            return false
          end

          if @map.map[x][y][0] == false
            return false
          end
        end
        return true
      end

      def space_in_right?(shape)
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0] + 1
          y = coordinate[1]

          if x > @width
            return false
          end

          if @map.map[x][y][0] == false
            return false
          end
        end
        return true
      end

      def space_in_left?(shape)
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0] - 1
          y = coordinate[1]

          if x < 1
            return false
          end

          if @map.map[x][y][0] == false
            return false
          end
        end
        return true
      end
    end
  end
end
