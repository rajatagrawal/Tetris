module Tetris
  module Engine
    module Calculations
      class Space

        def initialize(tetris_map)
          @tetris_map = tetris_map
        end

        def coordinates_in_bounds?(coordinates)
          coordinates.all? { |x,y| x_in_bounds?(x) && y_in_bounds?(y) }
        end

        def collides_with_other_shape?(coordinates, other_coordinates)
          coordinates.any? do |c|
            other_coordinates.include? c
          end
        end

        def space_in_map?(coordinates)
          coordinates.all? { |x,y| @tetris_map.empty?(x,y) }
        end

        private

        def x_in_bounds?(x)
          x > 0 && x <= @tetris_map.width
        end

        def y_in_bounds?(y)
          y > 0 && y <= @tetris_map.height
        end
      end
    end
  end
end
