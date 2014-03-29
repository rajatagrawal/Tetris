require_relative 'window'
require_relative 'movement'

module Tetris
  module GameStrategy
    module GameControl

      Shapes = [Square, Block]

      ShapeColors = ['blue',
                     'red',
                     'green',
                     'aqua',
                     'yellow',
                     'cyan',
                     'fuchsia']


      def generate_shape
        shape = Shapes.sample
        config = { x: shape_x(shape),
                   unit_side: unit_side,
                   color: ShapeColors.sample }
        shapes << shape.new(window, config)
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

      def shape_x(shape_class)
        shape_width = shape_class.new(window).width
        max_x = width - shape_width + 1
        (1..max_x).to_a.sample
      end
    end
  end
end
