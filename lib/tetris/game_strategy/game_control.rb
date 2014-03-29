require_relative 'window'
require_relative 'movement'

module Tetris
  module GameStrategy
    module GameControl

      def random_x_coordinate
        (1..(width-1)).to_a.sample
      end

      def generate_shape
        config = { x: random_x_coordinate, unit_side: unit_side }
        shapes << [Square, Block].sample.new(window, config)
      end

      def freeze_shape shape
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0]
          y = coordinate[1]
          tetris_map[x][y] = false
        end
      end

      def run_game
        if shapes.size == 0
          generate_shape
        end

        move_shape('down')
        if !space_to_move?('down', shapes.last)
          freeze_shape shapes.last
          generate_shape
        end
      end
    end
  end
end
