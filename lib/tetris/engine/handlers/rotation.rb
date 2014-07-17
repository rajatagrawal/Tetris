module Tetris
  module Engine
    module Handlers
      class Rotation

        def initialize(tetris_map)
          @map = tetris_map
          @height = tetris_map.height
          @width = tetris_map.width
        end

        def rotate_shape(shape, other_shape)
          shape.rotate if space_to_rotate?(shape, other_shape)
        end

        def space_to_rotate?(shape, other_shape)
          orientation = shape.orientation
          case orientation
          when '0_degrees'
            coordinates = shape.rotated_block_coordinates '90_degrees'
          when '90_degrees'
            coordinates = shape.rotated_block_coordinates '180_degrees'
          when '180_degrees'
            coordinates = shape.rotated_block_coordinates '270_degrees'
          when '270_degrees'
            coordinates = shape.rotated_block_coordinates '0_degrees'
          end

          can_rotate?(coordinates, other_shape)
        end

        def can_rotate?(coordinates, other_shape)
          return false if !fits_in_map?(coordinates) ||
            colliding_with_other_shape?(coordinates, other_shape) ||
            !space_in_map?(coordinates)
          true
        end

        def fits_in_map?(coordinates)
          coordinates.all? do |x,y|
            x_in_bounds = (1..@width).cover?(x)
            y_in_bounds = (1..@height).cover?(y)
            x_in_bounds && y_in_bounds
          end
        end

        def colliding_with_other_shape?(coordinates, other_shape)
          coordinates.any? do |x,y|
            other_shape.coordinates.include? [x,y,other_shape.color]
          end
        end

        def space_in_map?(coordinates)
          coordinates.all? { |x,y| @map[x,y] == 'none' }
        end
      end

    end
  end
end
