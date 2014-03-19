module Tetris
  class Shape
    attr_accessor :x, :y, :color, :window

    def initialize(window, config={})
      @window = window
      @x = config[:x] || 0
      @y = config[:y] || 0
      @color = config[:color] || Gosu::Color::RED
    end

    def height
      0
    end

    def width
      0
    end

    def draw
    end
  end
end
