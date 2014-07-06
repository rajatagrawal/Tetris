module Tetris
  module Engine
    class Movement

      def initialize(tetris_map)
        @map = tetris_map.map
        @height = tetris_map.height
        @width = tetris_map.width
      end

      def move_shape(direction, shape, other_shape)
        if space_to_move?(direction, shape, other_shape)
          shape.move(direction)
        end
      end

      def drop_shape(shape, other_shape)
        while space_to_move?('down', shape, other_shape) do
          shape.move('down')
        end
      end

      def space_to_move?(direction, shape, other_shape)
        case direction
        when 'right'
          space_in_right?(shape, other_shape)
        when 'left'
          space_in_left?(shape, other_shape)
        when 'down'
          space_in_bottom?(shape, other_shape)
        when 'up'
          false
        end
      end

      def space_in_bottom?(shape, other_shape)
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0]
          y = coordinate[1] + 1

          if y > @height
            return false
          end

          if other_shape.block_coordinates.include? [x,y, other_shape.color]
            return false
          end

          if @map[x][y] != 'none'
            return false
          end
        end

        return true
      end

      def space_in_right?(shape, other_shape)
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0] + 1
          y = coordinate[1]

          if x > @width
            return false
          end

          if other_shape.block_coordinates.include? [x,y, other_shape.color]
            return false
          end

          if @map[x][y] != 'none'
            return false
          end
        end
        return true
      end

      def space_in_left?(shape, other_shape)
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0] - 1
          y = coordinate[1]

          if x < 1
            return false
          end

          if other_shape.block_coordinates.include? [x,y, other_shape.color]
            return false
          end

          if @map[x][y] != 'none'
            return false
          end
        end
        return true
      end
    end
  end
end
