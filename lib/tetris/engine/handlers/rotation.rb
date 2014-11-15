require 'tetris/engine/calculations/space'
require 'tetris/engine/calculations/coordinates'

module Tetris
  module Engine
    module Handlers
      class Rotation
        def initialize(tetris_map, players)
          @players = players
          @space_cal = Calculations::Space.new(tetris_map)
          @xy_cal = Calculations::Coordinates.new
        end

        def rotate_shape(player)
          player.shape.rotate if space_to_rotate?(player)
        end

        private

        def space_to_rotate?(player)
          player_xy = @xy_cal.rotated_xy_for(player.shape)
          other_shapes_xy = @xy_cal.other_shapes_xy(player.shape,
                                                    @players.map(&:shape))

          @space_cal.coordinates_in_bounds?(player_xy) &&
            !@space_cal.collides_with_other_shape?(player_xy, other_shapes_xy) &&
            @space_cal.space_in_map?(player_xy)
        end
      end
    end
  end
end
