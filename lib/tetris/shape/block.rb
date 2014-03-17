require 'tetris/shape/shape'
module Tetris
  class Block < Shape

    attr_accessor :side_length

    def initialize(window, config={})
      super
      @side_length = config[:side_length] || 10
    end

    def height
      side_length
    end

    def width
      side_length
    end

    def draw
      window.draw_quad(x, y, color,
                       x + side_length, y, color,
                       x + side_length, y + side_length, color,
                       x, y + side_length, color)
    end
  end
end
