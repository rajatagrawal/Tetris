require 'tetris/engine/handlers/shape/generator'

module Tetris
  module Engine
    module Handlers
      module Shape
        class Shape

          def initialize(width, unit_side)
            @width = width
            @unit_side = unit_side
          end

          def new_shape(player)
            if player.shape == nil
              player.shape = generate_shape(player)
            else
              player.shape = player.next_shape
              player.next_shape = generate_shape(player)
            end
          end

          private

          def generate_shape(player)
            Generator.generate_shape(player, @width, @unit_side)
          end
        end
      end
    end
  end
end
