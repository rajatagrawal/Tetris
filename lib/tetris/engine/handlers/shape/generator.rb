module Tetris
  module Engine
    module Handlers
      module Shape
        class Generator

          def self.generate_shape(player, width , unit_side)
            partition_size = width/Player.no_of_players
            base_x = partition_size * player.number
            x = base_x - (partition_size/2)
            config = {
              x: x,
              y: 1,
              color: player.color,
              unit_side: unit_side
            }
            Constants::SHAPES.sample.new(config)
          end
        end
      end
    end
  end
end
