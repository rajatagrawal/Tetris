require_relative '../color_parser'
module Tetris
  module UI
    module Shape
      class Block

        def initialize(canvas, shape)
          @canvas = canvas
          @shape = shape
          @shape_image = Gosu::Image.new(@canvas,
                                         ColorParser.parse_file_name(@shape.color),
                                         false)
        end

        def draw
          x = @shape.x * @shape.unit_side
          y = @shape.y * @shape.unit_side
          scaling_factor = @shape.unit_side / @shape_image.height.to_f
          @shape_image.draw(x, y, 0, scaling_factor, scaling_factor)
        end
      end
    end
  end
end
