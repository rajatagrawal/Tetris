require_relative '../color_parser'
module Tetris
  module UI
    module Shape
      class Block

        def initialize(canvas, shape)
          @canvas = canvas
          @shape = shape
        end

        def draw
          x = @shape.x * @shape.unit_side
          y = @shape.y * @shape.unit_side
          length = @shape.unit_side
          color = ColorParser.parse_color @shape.color
          @canvas.draw_quad(x,y,color,
                            x + length, y, color,
                            x + length, y + length, color,
                            x, y + length, color)

        end
      end
    end
  end
end
