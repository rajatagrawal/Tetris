require_relative 'shape'
module Tetris
  class Block < Shape

    def initialize(window, config={})
      super
    end

    def height
      unit_side
    end

    def width
      unit_side
    end

    def draw
      window.draw_quad(x, y, color,
                       x + unit_side, y, color,
                       x + unit_side, y + unit_side, color,
                       x, y + unit_side, color)
    end
  end
end
