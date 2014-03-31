require_relative 'shape'
module Tetris
  class Block < Shape

    def initialize(window, config={})
      super
    end

    def height
      1
    end

    def width
      1
    end

    def block_coordinates
      [[x,y, color]]
    end

    def draw
      x_value = x * unit_side
      y_value = y * unit_side
      window.draw_quad(x_value, y_value, color,
                       x_value + unit_side, y_value, color,
                       x_value + unit_side, y_value + unit_side, color,
                       x_value, y_value + unit_side, color)
    end
  end
end
