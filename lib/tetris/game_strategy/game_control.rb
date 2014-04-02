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
        shape_class = Shapes.sample
        config = { x: shape_x(shape_class),
                   unit_side: unit_side,
                   color: ShapeColors.sample }
        shape = shape_class.new(window, config)
        if space_empty?(shape)
          shapes << shape
        else
          Kernel.exit
        end
      end

      def freeze_shape shape
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0]
          y = coordinate[1]
          color = coordinate[2]
          tetris_map[x][y] = [false, color]
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

      def space_empty?(shape)
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0]
          y = coordinate[1]
          return false if tetris_map[x][y][0] == false
        end
        true
      end
    end
  end
end
