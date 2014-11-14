module Tetris
  module Engine
    module Handlers
      class Freeze

        def initialize(tetris_map)
          @tetris_map = tetris_map
        end

        def freeze_shape shape
          shape.coordinates.each do |x,y|
            @tetris_map[x,y] = shape.color
          end
        end
      end
    end
  end
end
