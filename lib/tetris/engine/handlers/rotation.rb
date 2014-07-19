module Tetris
  module Engine
    module Handlers
      class Rotation

        def initialize(tetris_map, players)
          @map = tetris_map
          @players = players
          @height = tetris_map.height
          @width = tetris_map.width
        end

        def rotate_shape player
          shape = player.shape
          shape.rotate if space_to_rotate?(shape, other_player_shapes(player))
        end

        private

        def other_player_shapes player
          (@players - [player]).map(&:shape)
        end

        def space_to_rotate?(shape, other_shapes)
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

          can_rotate?(coordinates, other_shapes)
        end

        def can_rotate?(coordinates, other_shapes)
          return false if !fits_in_map?(coordinates) ||
            colliding_with_other_shapes?(coordinates, other_shapes) ||
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

        def colliding_with_other_shapes?(coordinates, other_shapes)
          coordinates.any? do |x,y|
            other_shapes.any? { |shape| shape.coordinates.include? [x,y,shape.color] }
          end
        end

        def space_in_map?(coordinates)
          coordinates.all? { |x,y| @map[x,y] == 'none' }
        end
      end
    end
  end
end
