require 'tetris/engine/calculations/space'
require 'tetris/engine/calculations/coordinates'

module Tetris
  module Engine
    module Handlers
      class Movement
        def initialize(tetris_map, players)
          @players = players
          @space_cal = Calculations::Space.new(tetris_map)
          @xy_cal = Calculations::Coordinates.new
        end

        def move_shape(player, direction)
          player.shape.move(direction) if space_to_move?(player, direction)
        end

        def drop_shape player
          shape = player.shape
          while space_to_move?('down', shape, other_player_shapes(player)) do
            shape.move('down')
          end
        end

        private

        def space_to_move?(player, direction)
          player_xy = @xy_cal.coordinates_for(player.shape, direction )
          other_shapes_xy = @xy_cal.other_shape_coordinates(player.shape,
                                                            @players.map(&:shape))

          @space_cal.coordinates_in_bounds?(player_xy) &&
            !@space_cal.collides_with_other_shape?(player_xy, other_shapes_xy) &&
            @space_cal.space_in_map?(player_xy)
        end
      end
    end
  end
end
