module Tetris
  module Engine
    module Handlers
      class Movement

        def initialize(tetris_map, players)
          @map = tetris_map
          @players = players
          @height = tetris_map.height
          @width = tetris_map.width
        end

        def move_shape(player, direction)
          shape = player.shape
          shape.move(direction) if space_to_move?(direction,
                                                  shape,
                                                  other_player_shapes(player))
        end

        def drop_shape player
          shape = player.shape
          while space_to_move?('down',
                               shape,
                               other_player_shapes(player)) do
            shape.move('down')
          end
        end

        private

        def other_player_shapes player
          (@players - [player]).map(&:shape)
        end

        def space_to_move?(direction, shape, other_shapes)
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

          satisfy_criterias?(coordinates, other_shapes)
        end

        def satisfy_criterias?(coordinates, other_shapes)
          return false if !shape_fits_in_map?(coordinates) ||
            colliding_with_other_shapes?(coordinates, other_shapes) ||
            !space_in_map?(coordinates)
          true
        end

        def space_in_map?(coordinates)
          coordinates.all? { |x,y| @map[x,y] == 'none' }
        end

        def colliding_with_other_shapes?(coordinates, other_shapes)
          coordinates.any? do |x,y|
            other_shapes.any? do |other_shape|
              other_shape.coordinates.include? [x,y,other_shape.color]
            end
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
end
