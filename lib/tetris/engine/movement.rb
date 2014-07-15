module Tetris
  module Engine
    class Movement

      def initialize(tetris_map)
        @map = tetris_map
        @height = tetris_map.height
        @width = tetris_map.width
      end

      def move_shape(direction, shape, other_shapes)
        if space_to_move?(direction, shape, other_shapes)
          shape.move(direction)
        end
      end

      def drop_shape(shape, other_shapes)
        while space_to_move?('down', shape, other_shapes) do
          shape.move('down')
        end
      end

      private

      def space_to_move?(direction, shape, other_shapes)
        other_shapes.all? do |other_shape|
          case direction
          when 'right'
            coordinates = shape.coordinates.map do |x,y|
              [x+1,y]
            end
          when 'left'
            coordinates = shape.coordinates.map do |x,y|
              [x-1,y]
            end
          when 'down'
            coordinates = shape.coordinates.map do |x,y|
              [x,y+1]
            end
          when 'up'
            return false
          end

          satisfy_criterias?(coordinates, other_shape)
        end
      end

      def satisfy_criterias?(coordinates, other_shape)
        return false if !shape_fits_in_map?(coordinates) ||
                        colliding_with_other_shape?(coordinates, other_shape) ||
                        !space_in_map?(coordinates)
        true
      end

      def space_in_map?(coordinates)
        coordinates.all? { |x,y| @map[x,y] == 'none' }
      end

      def colliding_with_other_shape?(coordinates, other_shape)
        coordinates.any? do |x,y|
          other_shape.coordinates.include? [x,y,other_shape.color]
        end
      end

      def shape_fits_in_map?(coordinates)
        coordinates.all? { |x,y| x_in_bounds?(x) && y_in_bounds?(y) }
      end

      def x_in_bounds?(x)
        x > 0 && x <= @width
      end

      def y_in_bounds?(y)
        y > 0 && y <= @height
      end
    end
  end
end
